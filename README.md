# Frank Consulting Service

> AI-powered consulting & financial services landing site, plus an interactive customer archive tool (ABC list scoring).

🔗 **Live site**: <https://wentaobi.github.io/frank-consulting/>
📋 **Customer archive**: <https://wentaobi.github.io/frank-consulting/customer-archive.html>

## Project structure

| File | Purpose |
|---|---|
| `index.html` | Main landing page — bilingual EN / 中文, services, financial offerings, AI tools, contact form |
| `customer-archive.html` | Interactive customer archive — ABC list scoring (Relationship, Occupation, Age, Married, Child, House, Income, Dissatisfied, Entrepreneurship, Coachable, Total Points, Notes), avatar upload, search, filtering, JSON/CSV import/export. All data stays in the visitor's browser localStorage. |
| `.nojekyll` | Tells GitHub Pages not to run Jekyll preprocessing |
| `update.sh` | One-command helper to commit & push local changes |

## Local preview

Just open `index.html` in any browser — everything is self-contained, no build step.

## Deploy

This repo is connected to GitHub via SSH (`git@github.com:Wentaobi/frank-consulting.git`) and deployed via **GitHub Pages**.

To push updates after editing locally:

```bash
bash update.sh                  # 用默认 commit 信息
bash update.sh "your message"   # 自定义 commit 信息
```

Or manually:

```bash
git add -A && git commit -m "your message" && git push
```

GitHub Pages will rebuild within ~1 minute.

## First-time Pages setup (already done)

Repo → Settings → Pages → Source: *Deploy from a branch* → Branch: `main` / `(root)` → Save.
