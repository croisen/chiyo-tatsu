#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <string>

#include "zip.h"
#include "json/json.h"

#include "col_lim_fprintf.hpp"
#include "kotatsu_utils.hpp"
#include "memtracker_pair.h"

using namespace std;

static bool parseKotatsuJson(
    const char *name, const char *txt, const uint64_t size,
    kotatsu::KotatsuBackup kBackup
)
{
    Json::Value root;
    Json::Reader reader;
    string iText = string();
    if (txt != NULL)
        iText = string(txt);

    if (!reader.parse(iText, root)) {
        chiyotatsuLog(
            CHCRIT, "Kotatsu backup contains invalid json in file: %s\n", name
        );
        return false;
    }

    if (strcmp(name, "index") == 0) {
        kotatsu::Index index;
        index.app_id      = root[0]["app_id"].asString();
        index.app_version = root[0]["app_version"].asUInt64();
        index.created_at  = root[0]["created_at"].asUInt64();
        kBackup.index.push_back(index);
        return true;
    }

    chiyotatsuLog(
        CHCRIT, "Kotatsu backup contains a file I do not know of yet: %s\n",
        name
    );
    return false;
}

namespace kotatsu
{
KotatsuBackup readReference(string reference)
{
    KotatsuBackup kBackup;
    int res        = 0;
    zip_t *kZipRef = zip_open(reference.c_str(), ZIP_RDONLY, &res);
    if (kZipRef == NULL) {
        zip_error_t err;
        zip_error_init_with_code(&err, res);
        chiyotatsuLog(
            CHFAIL, "Failed to read kotatsu reference file: '%s'\nError: %s\n",
            reference.c_str(), zip_error_strerror(&err)
        );
        zip_error_fini(&err);
        exit(EXIT_FAILURE);
    }

    struct zip_stat *kZipInfo =
        (struct zip_stat *)mTCalloc(1, sizeof(struct zip_stat));
    zip_stat_init(kZipInfo);

    zip_file_t *kZipFD = nullptr;
    char *txt          = nullptr;
    int64_t count      = 0;
    while (zip_stat_index(kZipRef, count, 0, kZipInfo) == 0) {
        txt    = (char *)mTCalloc(kZipInfo->size + 1, sizeof(char));
        kZipFD = zip_fopen_index(kZipRef, count, 0);
        zip_fread(kZipFD, txt, kZipInfo->size);
        chiyotatsuLog(CHINFO, "Parsing kotatsu file: %s\n", kZipInfo->name);
        if (!parseKotatsuJson(kZipInfo->name, txt, kZipInfo->size, kBackup))
            goto parsing_json_failed; // HAHAHAHAHAHAHAHAHAA

        zip_fclose(kZipFD);
        mTFree(txt);
        count += 1;
    }

    zip_close(kZipRef);
    return kBackup;

parsing_json_failed:
    mTFree(txt);
    zip_fclose(kZipFD);
    zip_close(kZipRef);
    exit(EXIT_FAILURE);
}
} // namespace kotatsu
