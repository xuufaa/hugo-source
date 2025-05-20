
## 启用 Fuse.js 搜索功能（适用于 PaperMod）

1. 在 `config.toml` 添加：
[params.search]
enable = true
type = "fuse"
fuse = { isCaseSensitive = false, shouldSort = true }

2. 在页面头部引入 `search.js`（使用 PaperMod 已支持）

3. 确保你有 `index.json` 输出：
[outputs]
home = ["HTML", "RSS", "JSON"]
section = ["HTML", "RSS"]

4. 搜索界面默认地址为 `/search/`
