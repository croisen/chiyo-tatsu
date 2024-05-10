package tachiyomi_source

import (
	"encoding/json"
	"strconv"
)

type Source struct {
	Name          string `json:"name"`
	Lang          string `json:"lang"`
	Id            string `json:"id"`
	BaseUrl       string `json:"baseUrl"`
	VersionId     int64  `json:"versionId"`
	HasCloudflare int64  `json:"hasCloudflare"`
}

type FullSource struct {
	Name         string   `json:"name"`
	Package      string   `json:"package"`
	Apk          string   `json:"apk"`
	Lang         string   `json:"lang"`
	Code         int64    `json:"code"`
	Version      string   `json:"version"`
	Nsfw         int64    `json:"nsfw"`
	HasReadme    int64    `json:"hasReadme"`
	HasChangelog int64    `json:"hasChangelog"`
	Sources      []Source `json:"sources"`
}

type MTachiyomiSource map[int64]FullSource

func ReadTachiyomiSources(sourceJson string) MTachiyomiSource {
	// I'm tired of naming variables now
	m := make(MTachiyomiSource)
	var a []FullSource

	err := json.Unmarshal([]byte(sourceJson), &a)
	if err != nil {
		panic(err)
	}

	for _, s1 := range a {
		ss := s1.Sources
		for _, s2 := range ss {
			i, err := strconv.ParseInt(s2.Id, 10, 64)
			if err != nil {
				panic(err)
			}

			m[i] = s1
		}
	}

	return m
}
