package chiyototatsu

import (
	"fmt"
	"net/url"
	"strings"
	"time"

	"github.com/croisen/chiyo-tatsu/utils/kotatsu_backups"
	"github.com/croisen/chiyo-tatsu/utils/tachiyomi_backups"
	"github.com/croisen/chiyo-tatsu/utils/tachiyomi_source"
)

func Chiyototatsu(
	tBackup *tachiyomi_backups.Backup, kBackup *kotatsu_backups.Backup, sources tachiyomi_source.MTachiyomiSource) *kotatsu_backups.Backup {
	kCats := kBackup.Categories
	kCatDef := kotatsu_backups.Category{
		Category_id: uint64(len(kCats)) + 1,
		Created_at:  uint64(time.Now().Unix()),
		Sort_key:    uint64(len(kCats)) + 1,
		Title:       "CH - Default",
		Order:       "NEWEST", // Rando up to the end
		Track:       false,
		Show_in_lib: false,
	}

	kCats = append(kCats, kCatDef)
	kCatSize := uint64(len(kCats))
	for _, tCat := range tBackup.Categories {
		kCat := kotatsu_backups.Category{
			Category_id: kCatSize + uint64(tCat.Order),
			Created_at:  uint64(time.Now().Unix()),
			Sort_key:    kCatSize + uint64(tCat.Order),
			Title:       "CH - " + tCat.Name,

			Order:       "NEWEST", // Rando up to the end
			Track:       false,
			Show_in_lib: false,
		}
		kCats = append(kCats, kCat)
	}

	kBackup.Categories = kCats
	for _, tManga := range tBackup.MangaBackup {
		catID := kCatSize
		author := "Unknown"
		if len(tManga.GetCategories()) != 0 {
			catID = kCatSize + uint64(tManga.Categories[0])
		}
		if tManga.Author != nil {
			author = *tManga.Author
		}

		source, ok := sources[tManga.Source]
		if !ok {
			fmt.Println("Source ID:", tManga.Source, "Not Found!")
			continue
		}

		var usedSource tachiyomi_source.Source
		for _, s := range source.Sources {
			if fmt.Sprint(tManga.Source) == s.Id {
				usedSource = s
				break
			}
		}

		urll := tManga.GetUrl()
		public_url := ""
		if urll[0] == '/' {
			public_url = usedSource.BaseUrl + tManga.GetUrl()
		} else {
			u, err := url.Parse(urll)
			if err != nil {
				panic(err)
			}

			urll = u.Path
			public_url = tManga.GetUrl()
		}

		kFav := kotatsu_backups.Favourite{
			Category_id: catID,
			Created_at:  uint64(time.Now().Unix()),

			Manga_id: 0, // Rando again
			Sort_key: 0,
		}

		kManga := kotatsu_backups.Manga{
			Title:     tManga.GetTitle(),
			Alt_title: tManga.GetTitle(),
			Author:    author,

			Cover_url:  tManga.GetThumbnailUrl(),
			Url:        urll,
			Public_url: public_url,

			Source: strings.ToUpper(source.Sources[0].Name),

			Id:     0, // Rando up to the end for now
			Nsfw:   false,
			Rating: 4.2,
			State:  "",
		}

		for _, tGenre := range tManga.GetGenre() {
			kTag := kotatsu_backups.Tags{
				Title:  tGenre,
				Key:    strings.ToLower(tGenre),
				Id:     0,
				Source: "", // TODO
			}

			kManga.Tags = append(kManga.Tags, kTag)
		}

		kFav.Manga = kManga
		kBackup.Favourites = append(kBackup.Favourites, kFav)
	}

	return kBackup
}
