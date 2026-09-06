# 跨平台相容性

本 repository 採用「單一核心來源 + 平台 adapter」：每個 `<skill-slug>/SKILL.md` 是唯一的行為規格，README 是人類文件；不為不同 AI 系統維護多份內容相同的 skill。

## 使用方式

1. 先查看下方能力矩陣，確認目標系統能完成該 skill 的必要能力。
2. 依 [adapters](adapters/) 的目標系統說明，將 skill 以 symlink 或複製方式放到該系統的發現目錄。
3. 執行 [portability tests](PORTABILITY_TESTS.md) 中對應 skill 的手動驗收。

可用 `scripts/install-symlinks.sh <目標-skills-目錄> [skill-slug...]` 在 macOS／Linux 建立 symlink。它絕不覆寫既有目錄或連結。

## 能力矩陣

| Skill | 必要能力 | 可選能力 | 不支援時的降級行為 |
| --- | --- | --- | --- |
| `card-to-vcf` | PDF 頁面檢視、OCR 或多模態辨識、多回合對話、文字輸出 | 建立可下載檔案 | 無法讀取 PDF 時請使用者提供可讀的頁面影像／文字；無法建立檔案時，在確認後輸出完整 VCF code block。 |
| `thinking-naval-way` | 多回合文字對話、讀取使用者明確提供的內容 | 讀取使用者指定 URL 或附件 | 無法存取 URL／附件時，明確說明並請使用者貼上或重新附上內容；不可自行擴大蒐集範圍。 |
| `rer-coach` | 多回合對話、在本次對話中保留狀態 | 跨對話記憶 | 沒有跨對話記憶時，請使用者在開始時貼上判斷原則卡與必要脈絡。 |

## 核心格式原則

- `SKILL.md` 使用 Markdown 與最小 YAML frontmatter：只保證 `name`、`description` 等基礎欄位；避免把單一平台專屬設定放入核心檔。
- 平台特定的安裝位置、工具名稱與限制寫在 `adapters/`，而非複製 skill 內容。
- 核心規格必須明定外部讀取、檔案輸出或其他能力缺失時的安全降級行為。
- 系統沒有自動 discovery 時，使用者仍可在新對話明確附上或貼入 `SKILL.md` 來執行；這是最低相容模式。

## 已有 adapter

- [Codex](adapters/codex.md)
- [GitHub Copilot](adapters/github-copilot.md)
- [Generic agent](adapters/generic-agent.md)

其他系統尚未經本 repository 驗證。新增 adapter 時，請不要猜測其路徑或 frontmatter 支援範圍；應以該系統當前官方文件驗證後再收錄。
