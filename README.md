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
| <img width="400" alt="image" src="https://github.com/user-attachments/assets/ca8e53f6-3527-4189-acea-92422f8f83aa"> | <img width="400" alt="image" src="https://github.com/user-attachments/assets/2a594027-e897-4fed-b356-8e8ae8093b33"> |

### アウトプット(各ユーザーのフィード投稿)表示
| 一覧 |
| ---- |
| <img width="400" alt="image" src="https://github.com/user-attachments/assets/d46c4ce2-3244-463a-b23a-15433acf1bff"> |

作成中...
