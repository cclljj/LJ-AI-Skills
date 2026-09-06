# GitHub Copilot Adapter

GitHub Copilot 支援 Agent Skills 的 `SKILL.md` 與 YAML frontmatter。個人 skills 可放於 `~/.copilot/skills/<skill-name>/` 或 `~/.agents/skills/<skill-name>/`；專案 skills 可放於 `.github/skills/`、`.claude/skills/` 或 `.agents/skills/`。詳見 [GitHub 官方文件](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills)。

個人安裝可建立 symlink：

```bash
./scripts/install-symlinks.sh "$HOME/.agents/skills"
```

如需讓某個 repository 使用，請在該 repository 的支援目錄建立指向本 repository 各 skill 資料夾的 symlink。不要把這些 adapter 文件或 `AGENTS.md` 當成 skill 的必要執行內容。

安裝後用 Copilot 的 skills 清單或明確 skill request 驗證 discovery，並執行 [可攜性驗收](../PORTABILITY_TESTS.md)。
