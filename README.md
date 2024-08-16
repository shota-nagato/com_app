## バージョン
```
Ruby 3.3.0
Rails 7.1.3.4
Node.js 20.10.0
```

## 使用技術
```
ESBuild
TailwindCSS
RSpec(SystemSpec on Playwright)
```


## セットアップ
```
git clone git@github.com:shota-nagato/com_app.git
docker compose build
docker compose run --rm web yarn install
docker compose run --rm web rails db:create
docker compose up
```

## 機能

### ユーザー認証
- 新規登録
- ログイン・ログアウト
- プロフィール編集(名前・アバター画像)

### フィード登録
- RSSフィードの登録
- RSSフィードの削除

| 一覧 | 作成 |
| ---- | ---- |
| <img width="1072" alt="image" src="https://github.com/user-attachments/assets/df5d567b-1b48-443d-94b4-b4bf7a851910"> | <img width="1077" alt="image" src="https://github.com/user-attachments/assets/5812e4fd-5d48-4edb-b682-0f5e13cff244"> |

作成中...
