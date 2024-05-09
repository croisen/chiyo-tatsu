package kotatsu_backups

import (
	"archive/zip"
	"encoding/json"
	"fmt"
	"os"
)

type Tags struct {
	id     int64
	title  string
	key    string
	source string
}

type Manga struct {
	id         int64
	title      string
	alt_title  string
	url        string
	public_url string
	rating     float64
	nsfw       bool
	cover_url  string
	state      string
	source     string
	tags       []Tags
}

type Index struct {
	app_id      string
	app_version int64
	created_at  uint64
}

type History struct {
	manga_id   int64
	created_at uint64
	updated_at uint64
	chapter_id int64
	page       uint64
	scroll     int64
	percent    float64
	manga      []Manga
}

type Category struct {
	category_id uint64
	created_at  uint64
	sort_key    uint64
	title       string
	order       string
	track       bool
	show_in_lib bool
}

type Favourite struct {
	manga_id    int64
	category_id uint64
	created_at  uint64
	sort_key    uint64
	manga       []Manga
}

// This is just a guess
type Bookmark struct {
	manga_id   int64
	created_at uint64
	updated_at uint64
	chapter_id int64
	page       uint64
	scroll     int64
	percent    float64
	manga      []Manga
}

type Source struct {
	source   string
	enabled  bool
	sort_key uint64
}

type Backup struct {
	index      []Index // Should be only one but it's in an array in the JSON
	history    []History
	categories []Category
	favourites []Favourite
	bookmarks  []Bookmark
	sources    []Source
	settings   string // Yeah I ain't parsing this one man
}

func ReadReference(ref *os.File) *Backup {
	refRet := &Backup{}
	if ref == nil {
		fmt.Println("Reference kotatsu backup file was not passed with -r or --reference")
		os.Exit(1)
	}
	r, err := zip.OpenReader(ref.Name())

	return refRet
}
