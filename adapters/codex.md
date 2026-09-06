# Codex Adapter

Codex 的個人 skills 目錄由 `CODEX_HOME/skills` 管理。將本 repository 各 skill 資料夾連結到該目錄，即可保留此 repository 為唯一來源。

```bash
./scripts/install-symlinks.sh "$CODEX_HOME/skills"
```

若 `CODEX_HOME` 未設定，請先在本機確認 Codex 使用的 skills 目錄，再將其作為第一個參數。不要將整個 repository 直接覆寫到目標目錄。

完成後重啟或重新載入 Codex 的 skill discovery，再以 skill 名稱發出一個最小測試 request，並依 [可攜性驗收](../PORTABILITY_TESTS.md) 檢查。
