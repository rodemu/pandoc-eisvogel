# 最新環境での Pandoc Docker イメージの動作実験

`pandoc/latex:edge` をベースにEisvogel、PlantUML、日本語対応 したイメージが正常動作するかの実験用 Dockerfileです 

元ネタは [mickey-happygoluckyさんのDockerfile](https://github.com/mickey-happygolucky/pandoc-eisvogel)です

# ビルド

```
docker build -t pandoc-eisvogel
```

# 動作が確認できたバージョン

* 2023/07/05
    * Alpine Linux(version 3.16.4)
    * Eisvogel(version 2.4.0)
    * PlantUML(version 1.2023.9)