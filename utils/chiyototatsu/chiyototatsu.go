package chiyototatsu

import (
	"strings"
	"time"

	"github.com/croisen/chiyo-tatsu/utils/kotatsu_backups"
	"github.com/croisen/chiyo-tatsu/utils/tachiyomi_backups"
)

func Chiyototatsu(tBackup *tachiyomi_backups.Backup, kBackup *kotatsu_backups.Backup) *kotatsu_backups.Backup {
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
		if len(tManga.GetCategories()) != 0 {
			catID = kCatSize + uint64(tManga.Categories[0])
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

			Cover_url:  tManga.GetThumbnailUrl(),
			Url:        "", // tManga.GetUrl(), TODO yet
			Public_url: "", // tManga.GetUrl(), TODO yet

			Source: "", // TODO

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
