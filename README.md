# :feet: Biita!
Biita!は、海外旅行がしたい日本人〈ツアーゲスト〉と、旅行の手助けが可能な海外在住者〈ツアーキャスト〉が  
簡単に出会えるサービスです。

![スクリーンショット 2020-10-02 22 58 01](https://user-images.githubusercontent.com/67250685/94931475-c4842480-0502-11eb-9f33-ccae3e88d4e8.jpg)

<br />

## :globe_with_meridians: URL
URL: https://biita.net

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

## :notebook_with_decorative_cover: アプリを利用するメリット
**【海外旅行がしたい人にとって】**
- 日本語が通じない海外でも安心して旅行できる
- 比較的リーズナブルな価格で利用できる
- 多岐に渡るサービスに対応している
- 自分からプランを提案しガイドを募ることができる

**【海外在住者にとって】**
- スキマ時間や休日を使って、ちょっとしたお小遣いを稼げる
- 日本人と接する機会を増やせる

<br />

## :green_book: 工夫した点

- **「直感的なわかりやすさ・使いやすさ」**
を重視し、一つ一つの機能やデザインに細部までこだわりました。
- ユーザーがアプリを利用する際の不安要素を少なくできるよう、**ツアーゲストとツアーキャスト両方のレビュー機能**を実装しました。
- 黄色とオレンジという明るい色を基調とし、トップページに画像を多く取り入れることで、**「新しい旅や出会いのワクワク感」**
が感じられるようにしました。
- スマホでも快適に利用できるよう、戻るボタンやマイページに下タブを表示するなど、**スマホの使い方に合ったレスポンシブデザイン**を実装しました。

![スクリーンショット 2020-10-07 11 38 02](https://user-images.githubusercontent.com/67250685/95281555-73718900-0892-11eb-9050-1b719866529f.jpg)


<br />

## :books: 機能一覧

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
- 自動更新
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
  - レスポンシブ対応
  - テスト（250 examples）


<br />

## :closed_book: 使用技術
### フロントエンド
- Haml
- Sass
- JavaScript（ES6、一部jQuery）

### バックエンド
- Ruby 2.6.5  
- Rails 6.0.3.2  

### データベース
- MySQL2  

### テスト
- RSpec
- FactoryBot

### 開発環境
- Docker
- RuboCop

### 本番環境
- AWS(VPC、EC2、S3、Route53、ACM、ALB)  
- Nginx、Unicorn

<br />

## :blue_book: インフラ構成図
![スクリーンショット 2020-10-25 19 14 12](https://user-images.githubusercontent.com/67250685/97104327-63f99900-16f6-11eb-8c6d-785fd271ec71.jpg)

## :orange_book: ER図
![スクリーンショット 2020-10-25 18 45 11](https://user-images.githubusercontent.com/67250685/97103813-4de9d980-16f2-11eb-80b9-b6fcbaf381a2.jpg)