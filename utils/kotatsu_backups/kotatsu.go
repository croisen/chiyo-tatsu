package kotatsu_backups

import (
	"archive/zip"
	"encoding/json"
	"fmt"
	"io"
	"os"
)

type Tags struct {
	Id     int64  `json:"id"`
	Title  string `json:"title"`
	Key    string `json:"key"`
	Source string `json:"source"`
}

type Manga struct {
	Id         int64   `json:"id"`
	Title      string  `json:"title"`
	Alt_title  string  `json:"alt_title"`
	Author     string  `json:"author"`
	Url        string  `json:"url"`
	Public_url string  `json:"public_url"`
	Rating     float64 `json:"rating"`
	Nsfw       bool    `json:"nsfw"`
	Cover_url  string  `json:"cover_url"`
	State      string  `json:"state"`
	Source     string  `json:"source"`
	Tags       []Tags  `json:"tags"`
}

type Index struct {
	App_id      string `json:"app_id"`
	App_version int64  `json:"app_version"`
	Created_at  uint64 `json:"created_at"`
}

type History struct {
	Manga_id   int64   `json:"manga_id"`
	Created_at uint64  `json:"created_at"`
	Updated_at uint64  `json:"updated_at"`
	Chapter_id int64   `json:"chapter_id"`
	Page       uint64  `json:"page"`
	Scroll     int64   `json:"scroll"`
	Percent    float64 `json:"percent"`
	Manga      Manga   `json:"manga"`
}

type Category struct {
	Category_id uint64 `json:"category_id"`
	Created_at  uint64 `json:"created_at"`
	Sort_key    uint64 `json:"sort_key"`
	Title       string `json:"title"`
	Order       string `json:"order"`
	Track       bool   `json:"track"`
	Show_in_lib bool   `json:"show_in_lib"`
}

type Favourite struct {
	Manga_id    int64  `json:"manga_id"`
	Category_id uint64 `json:"category_id"`
	Created_at  uint64 `json:"created_at"`
	Sort_key    uint64 `json:"sort_key"`
	Manga       Manga  `json:"manga"`
}

// This is just a guess
type Bookmark struct {
	Manga_id   int64   `json:"manga_id"`
	Created_at uint64  `json:"created_at"`
	Updated_at uint64  `json:"updated_at"`
	Chapter_id int64   `json:"chapter_id"`
	Page       uint64  `json:"page"`
	Scroll     int64   `json:"scroll"`
	Percent    float64 `json:"percent"`
	Manga      Manga   `json:"manga"`
}

type Source struct {
	Source   string `json:"source"`
	Enabled  bool   `json:"enabled"`
	Sort_key uint64 `json:"sort_key"`
}

type Backup struct {
	Index      []Index     `json:"index"`
	History    []History   `json:"history"`
	Categories []Category  `json:"categories"`
	Favourites []Favourite `json:"favourites"`
	Bookmarks  []Bookmark  `json:"bookmarks"`
	Sources    []Source    `json:"sources"`
	Settings   string      `json:"settings"`
}

func ReadReference(ref string) *Backup {
	r, err := zip.OpenReader(ref)
	if err != nil {
		fmt.Println("Error in reading reference file", ref)
		os.Exit(1)
	}

	defer r.Close()
	var refRet Backup
	for _, f := range r.File {
		fmt.Println("Parsing kotatsu backup module:", f.Name)
		file, err := f.Open()
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
			err = json.Unmarshal(content, &refRet.Index)
			break
		case "history":
			err = json.Unmarshal(content, &refRet.History)
			break
		case "categories":
			err = json.Unmarshal(content, &refRet.Categories)
			break
		case "favourites":
			err = json.Unmarshal(content, &refRet.Favourites)
			break
		case "bookmarks":
			err = json.Unmarshal(content, &refRet.Bookmarks)
			break
		case "sources":
			err = json.Unmarshal(content, &refRet.Sources)
			break
		case "settings":
			refRet.Settings = string(content[:])
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

	return &refRet
}

func SaveToFile(zipName string, kBackup *Backup) {
	fmt.Println("Now creating", zipName)
	f1, err := os.Create(zipName)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	fw := zip.NewWriter(f1)

	indexs, err := json.MarshalIndent(kBackup.Index, "", "\t")
	historys, err := json.MarshalIndent(kBackup.History, "", "\t")
	categoriess, err := json.MarshalIndent(kBackup.Categories, "", "\t")
	favouritess, err := json.MarshalIndent(kBackup.Favourites, "", "\t")
	bookmarkss, err := json.MarshalIndent(kBackup.Bookmarks, "", "\t")
	sourcess, err := json.MarshalIndent(kBackup.Sources, "", "\t")

	indexf, err := fw.Create("index")
	_, err = indexf.Write(indexs)
	historyf, err := fw.Create("history")
	_, err = historyf.Write(historys)
	categoriesf, err := fw.Create("categories")
	_, err = categoriesf.Write(categoriess)
	favouritesf, err := fw.Create("favourites")
	_, err = favouritesf.Write(favouritess)
	bookmarksf, err := fw.Create("bookmarks")
	_, err = bookmarksf.Write(bookmarkss)
	sourcesf, err := fw.Create("sources")
	_, err = sourcesf.Write(sourcess)
	settingsf, err := fw.Create("settings")
	_, err = settingsf.Write([]byte(kBackup.Settings))

	err = fw.Close()
	if err != nil {
		panic(err)
	}

	err = f1.Close()
	if err != nil {
		panic(err)
	}
}
