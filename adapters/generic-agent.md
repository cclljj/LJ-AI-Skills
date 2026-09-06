# Generic Agent Adapter

若目標 AI 系統沒有 Agent Skills discovery 機制，仍可使用這些 skills：在開始工作前，將目標 skill 的完整 `SKILL.md` 內容附在對話或系統提供的自訂指令欄位中，然後再提供任務。

此模式的限制：

- 不保證系統有 PDF、OCR、URL 讀取、檔案輸出或跨對話記憶能力；以 [能力矩陣](../PORTABILITY.md#能力矩陣) 的降級規則為準。
- 每次新對話可能需要重新載入 skill；不要假設模型永久記得。
- `AGENTS.md` 僅是本 repository 的維護規範，目標系統不一定會讀取它。

完成後，依 [可攜性驗收](../PORTABILITY_TESTS.md) 中的目標 skill 檢查行為。
