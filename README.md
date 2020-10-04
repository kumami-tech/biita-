# :feet: Biita!
Biita!は、海外旅行がしたい日本人〈ツアーゲスト〉と、旅行の手助けが可能な海外在住者〈ツアーキャスト〉が  
簡単に出会えるサービスです。

![スクリーンショット 2020-10-02 22 58 01](https://user-images.githubusercontent.com/67250685/94931475-c4842480-0502-11eb-9f33-ccae3e88d4e8.jpg)

<br />

## :globe_with_meridians: URL
URL: http://18.180.76.151  

※トップページの右上にあるログインボタンをクリックしログイン画面に遷移した後、  
「ゲストログイン(閲覧用)」のボタンをクリックすると、フォームに文字を入力せずにログインできます。

<br />

## :notebook: 制作の背景
学生時代に海外で一人旅をしていた時、観光客の立場として以下のような不安や問題点を感じました。  

- **「旅行会社のツアー料金が高すぎる or 自分に合ったプランがない」**
- **「移動手段がタクシーしかないけれど、運転手に行きたい場所を正確に伝えられるか不安」**
- **「買い物でぼったくられそう」**

<br />

また、長期的な旅に出ていた時はずっと英語を使っていたため、海外滞在者の立場として、  
**「久しぶりに日本人に会って、日本語で会話がしたい」**
と感じました。  

そんな中、旅行先で偶然日本人と出会った時は大きな喜びを感じ、相手の方も同じように喜んでいました。

<br />

上記の経験を踏まえ、
**「安心かつ格安で海外旅行がしたい日本人と、**  
**現地のことをよく知っている海外在住の日本人をマッチングさせるサービス」**  
があれば上記の課題を解決できるのではないかと思い、本アプリを制作しました。  


<br />

## :green_book: アプリを利用するメリット
**【海外旅行がしたい人にとって】**
- 日本語が通じない海外でも安心して旅行できる
- 比較的リーズナブルな価格で利用できる
- 多岐に渡るサービスに対応している
- 自分からプランを提案しガイドを募ることができる

**【海外在住者にとって】**
- スキマ時間や休日を使って、ちょっとしたお小遣いを稼げる
- 日本人と接する機会を増やせる


<br />

## :closed_book: 機能一覧

### ユーザー機能
- ユーザー登録・編集・削除（deviseのgemを使用)
- ゲストログイン
- プロフィール画像の登録・編集（carrierwaveのgemを使用）
- マイページにて以下の投稿の一覧表示
  - 全ての自分の投稿
  - 自分の投稿で申し込みがあった投稿
  - 申込済みの投稿
  - お気に入りに追加した投稿

### 投稿機能
- ツアーゲストとツアーキャスト両方の立場による投稿・編集・削除
- 一覧表示、詳細表示
- 地図表示（Google Maps API）
- タグ付け（acts-as-taggable-onのgemを使用）
- 申し込み・キャンセル
- 申込済みユーザーの表示（他人の投稿の場合は人数のみを表示）
- お気に入り追加（非同期）
- 検索（キーワード検索・タグ検索）

### メッセージ機能
- ユーザー同士のメッセージ送信（非同期、画像も送信可）
- トーク履歴の表示

### レビュー機能
- ユーザーに対するレビューの投稿
- 一覧表示（星マークで点数を可視化）

### フォロー機能
- ユーザーのフォロー・フォロー解除（非同期）
- フォロー中のユーザーとフォロワーの一覧表示

### 通知機能
  - 以下のタイミングでユーザーに通知を送信
    - 自分の投稿が申し込まれた時
    - 自分の投稿がキャンセルされた時
    - 自分の投稿がお気に入りに追加された時
    - 他のユーザーからメッセージが届いた時
    - 自分のレビューが投稿された時
    - 他のユーザーからフォローされた時
  - 一覧表示
  - 個々の通知の削除と全削除
  - 未確認の通知がある場合はマークを表示

### その他
  - 単体テスト（250 examples）
  - レスポンシブ対応

  ![スクリーンショット 2020-10-04 22 16 03](https://user-images.githubusercontent.com/67250685/95016647-4012dc80-068f-11eb-82cb-ee09c45ac9a9.jpg)

<br />

## :blue_book: 使用技術
### フロントエンド
- Haml
- Sass
- JavaScript
- jQuery

### バックエンド
- Ruby 2.6.5  
- Rails 6.0.3.2  

### データベース
- MySQL2  

### テスト
- RSpec
- FactoryBot

### 本番環境
- AWS(EC2、S3)  
- Nginx、Puma

<br />

## :orange_book: ER図
![スクリーンショット 2020-10-04 17 00 20](https://user-images.githubusercontent.com/67250685/95010314-26f43680-0663-11eb-9024-1498d49dbb39.jpg)