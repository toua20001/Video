# README

## VideoManagementServer
動画の管理が煩雑になっていた兼rails／bootstrapの勉強がしたかったので作ったWebAPです。  

## How To Use
1. 動画を登録する
  - 動画を「public/assets/upload」に追加する。
  - 「videos/upload」にアクセスする。
  - アップロードボタンをクリックする。

2. 動画を検索する
  - videosの検索バーに検索条件を設定し、検索ボタンを押下する。

3. 動画を編集する
  - videosの一覧から動画を選択する。
  - 右上のEditボタンを押下する。
  - 情報を編集する。
  - 登録ボタンを押下する。

## 未実装なところ
- タグの一括登録機能
- タグ一覧ページの作成 → 追加済み（2020/05/17）
- タイトル／タグの両方で検索する機能
- 動画の削除機能 → 追加済み（2020/05/17）
- アップロード機能の非同期処理化
- 各ページのレイアウト改善
- ページング機能