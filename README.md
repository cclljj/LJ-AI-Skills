# LJ AI Skills

個人 AI skills 的版本控制倉庫。此處的每個 skill 都應能被人類閱讀、被 AI 理解，並能在新電腦上以 Git 快速還原。

## 快速開始

```bash
git clone <repository-url>
cd LJ-AI-Skills
```

本 repository 是所有 skill 的唯一來源。依目標 AI 系統以 symlink 或複製安裝單一 skill；不要維護多份內容。請先閱讀 [跨平台相容性](PORTABILITY.md) 並選擇對應的 [platform adapter](adapters/)。

## 結構

```text
.
├── README.md                 # 倉庫總覽與安裝入口
├── SKILLS_INDEX.md           # 所有已收錄 skills 的可搜尋清單
├── CONTRIBUTING.md           # 新增或更新 skill 的規範
├── AGENTS.md                 # 給 AI 協作者的操作規則
├── PORTABILITY.md             # 跨平台能力矩陣與安裝原則
├── PORTABILITY_TESTS.md       # 可攜性手動驗收
├── adapters/                  # 各 AI 系統的載入／安裝說明
├── scripts/                   # 安全的本機安裝輔助工具
├── templates/
│   └── SKILL-README-template.md
└── <skill-slug>/
    ├── SKILL.md              # 給 AI 的可執行指令（若適用）
    ├── README.md             # 給人類與 AI 的完整介紹（必備）
    ├── scripts/              # 可選：輔助程式
    ├── references/           # 可選：必要參考資料
    └── assets/               # 可選：範例或素材
```

## 收錄原則

每一個 skill 必須：

- 使用唯一、穩定、全小寫連字號的資料夾名稱，例如 `meeting-summary`。
- 有自己的 `README.md`，並依模板完整說明目的、原理／特殊設計、使用方法、需求與限制。
- 在 `SKILLS_INDEX.md` 登錄，讓人和 AI 都能先從單一入口找到它。
- 將可執行指令與參考內容一同納入版本控制；不要提交密碼、token、個人資料或大型衍生檔案。
- 提供足以驗證基本功能的範例或檢查步驟。
- 明列必要能力、可選能力與能力不足時的降級方式；平台差異只能放在 `adapters/`，不可複製核心 skill。

詳細規範見 [CONTRIBUTING.md](CONTRIBUTING.md)。
