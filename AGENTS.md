# AI 協作者規則

新增或修改本 repository 的 skill 前，先閱讀根目錄的 `README.md`、`CONTRIBUTING.md`、`SKILLS_INDEX.md`、`PORTABILITY.md` 與 `PORTABILITY_TESTS.md`。

對每個新增 skill：

1. 維持一個獨立、全小寫連字號命名的目錄。
2. 依 `templates/SKILL-README-template.md` 建立完整 README，不得略過目的、原理／特殊設計、使用方法、限制與維護資訊。
3. 將 skill 登錄至 `SKILLS_INDEX.md`。
4. 如有 `SKILL.md`，讓它可在沒有隱含背景知識下被另一個 AI agent 執行。
5. 不得提交憑證、token、個資或未獲授權的第三方內容；不確定的資訊要標示為待驗證。
6. 在 README 寫出必要能力、可選能力與安全降級方式；核心 `SKILL.md` 維持平台中立，平台安裝資訊只寫在 `adapters/`。
7. 為新行為加入可攜性驗收案例，並在可用的目標系統實際驗證。

修改完成後，檢查所有新增文件連結與範例命令是否正確。保留既有使用者檔案與未相關變更。
