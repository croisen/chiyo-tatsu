package kotatsu_backups

import (
	"archive/zip"
	"encoding/json"
	"fmt"
	"io"
	"os"
)

type TagsStruct struct {
	Id     int64  `json:id`
	Title  string `json:title`
	Key    string `json:key`
	Source string `json:source`
}

type MangaStruct struct {
	Id         int64        `json:id`
	Title      string       `json:title`
	Alt_title  string       `json:alt_title`
	Url        string       `json:url`
	Public_url string       `json:public_url`
	Rating     float64      `json:rating`
	Nsfw       bool         `json:nsfw`
	Cover_url  string       `json:cover_url`
	State      string       `json:state`
	Source     string       `json:source`
	Tags       []TagsStruct `json:tags`
}

type Index struct {
	App_id      string `json:app_id`
	App_version int64  `json:app_version`
	Created_at  uint64 `json:created_at`
}

type History struct {
	Manga_id   int64         `json:manga_id`
	Created_at uint64        `json:created_at`
	Updated_at uint64        `json:updated_at`
	Chapter_id int64         `json:chapter_id`
	Page       uint64        `json:page`
	Scroll     int64         `json:scroll`
	Percent    float64       `json:percent`
	Manga      []MangaStruct `json:manga`
}

type Category struct {
	Category_id uint64 `json:category_id`
	Created_at  uint64 `json:created_at`
	Sort_key    uint64 `json:sort_key`
	Title       string `json:title`
	Order       string `json:order`
	Track       bool   `json:track`
	Show_in_lib bool   `json:show_in_lib`
}

type Favourite struct {
	Manga_id    int64         `json:manga_id`
	Category_id uint64        `json:category_id`
	Created_at  uint64        `json:created_at`
	Sort_key    uint64        `json:sort_key`
	Manga       []MangaStruct `json:manga`
}

// This is just a guess
type Bookmark struct {
	Manga_id   int64         `json:manga_id`
	Created_at uint64        `json:created_at`
	Updated_at uint64        `json:updated_at`
	Chapter_id int64         `json:chapter_id`
	Page       uint64        `json:page`
	Scroll     int64         `json:scroll`
	Percent    float64       `json:percent`
	manga      []MangaStruct `json:manga`
}

type Source struct {
	Source   string `json:source`
	Enabled  bool   `json:enabled`
	Sort_key uint64 `json:sort_key`
}

type Backup struct {
	Index      []Index     `json:index` // Should be only one but it's in an array in the JSON
	History    []History   `json:history`
	Categories []Category  `json:categories`
	Favourites []Favourite `json:favourites`
	Bookmarks  []Bookmark  `json:bookmarks`
	Sources    []Source    `json:sources`
	Settings   string      `json:settings` // Yeah I ain't parsing this one man
}

func ReadReference(ref string) *Backup {
	r, err := zip.OpenReader(ref)
	defer r.Close()
	if err != nil {
		fmt.Println("Error in reading reference file", ref)
		os.Exit(1)
	}

	var index []Index
	var history []History
	var categories []Category
	var favourites []Favourite
	var bookmarks []Bookmark
	var sources []Source
	var settings string

	for _, f := range r.File {
		fmt.Println("Parsing kotatsu backup module:", f.Name)
		file, err := f.Open()
		defer file.Close()
		if err != nil {
			fmt.Println("Error parsing kotatsu backup module:", f.Name)
			fmt.Println(err)
			os.Exit(1)
		}

		content, err := io.ReadAll(file)
		if err != nil {
			fmt.Println("Error parsing kotatsu backup module:", f.Name)
			fmt.Println(err)
			os.Exit(1)
		}

		switch f.Name {
		case "index":
			err = json.Unmarshal(content, &index)
			break
		case "history":
			err = json.Unmarshal(content, &history)
			break
		case "categories":
			err = json.Unmarshal(content, &categories)
			break
		case "favourites":
			err = json.Unmarshal(content, &favourites)
			break
		case "bookmarks":
			err = json.Unmarshal(content, &bookmarks)
			break
		case "sources":
			err = json.Unmarshal(content, &sources)
			break
		case "settings":
			settings = string(content[:])
			break
		default:
			fmt.Println("Unknown module in the kotatsu backup:", f.Name)
			break
		}

		if err != nil {
			fmt.Println("Error parsing kotatsu backup module:", f.Name)
			fmt.Println(err)
			os.Exit(1)
		}
	}

	refRet := &Backup{
		Index:      index,
		History:    history,
		Categories: categories,
		Favourites: favourites,
		Bookmarks:  bookmarks,
		Sources:    sources,
		Settings:   settings,
	}
	return refRet
}
