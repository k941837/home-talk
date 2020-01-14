# Home-Pay DB設計
・開発環境
（Ruby/Ruby on Rails/JQuery/MySQL/Github/AWS/Visual Studio Code）

### ・月別支出の登録
トップページ画面の支出登録ボタンをクリックし、年月、カテゴリーを選択し、毎月の支出をカテゴリー毎に登録することが出来る。


### ・月別収入の登録
トップページ画面の収入登録ボタンをクリックし、年月、カテゴリーを選択し、毎月の収入をカテゴリー毎に登録することが出来る。

### ・円グラフ表示
Chartkickのgemを活用し、カテゴリー別の支出を円グラフで表示。

![image](https://user-images.githubusercontent.com/55436678/72310320-ca13b300-36c4-11ea-93ce-4625201139d1.png)


### ・カテゴリー別の支出前月比較
トップページのマイページボタンをクリックすると、今月のカテゴリー別支出を前月分と比較して一覧で見ることが出来る為、前月よりもどのカテゴリーが今月支出が多いか、少ないかが一目で分かる。また詳細ボタンをクリックすると、そのカテゴリーの内訳、登録日等が表示される。

![image](https://user-images.githubusercontent.com/55436678/72311905-a30bb000-36c9-11ea-926c-17191f64de35.png)


### ・投稿削除機能
マイページ削除ボタンクリックで、投稿内容の削除が可能。

### ・収支メモ
マイページの収支メモボタンをクリックすると、メモ書き投稿画面が表示される。今月のトピックや、収支情報の特記事項を自由に記入できる。

![image](https://user-images.githubusercontent.com/55436678/72312389-532de880-36cb-11ea-9a64-f1120a20cfb9.png)


### ・貯蓄くん顔マーク機能
今月の貯蓄状況を一目で管理できる。（今月収入）ー（今月支出）が５万以上でトップページに笑顔マーク、２万以上で普通マーク、２万以下は涙顔マークになる。詳細はマークをクリックすると表示できる。


### ・月別検索機能
トップページの月別検索で各月の収支情報を検索表示することが出来る。


## userテーブル
|column|Type|Option|
|------|----|------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null:false|


### Association
- has_many :incomes
- has_many :expenses
- has_many :memos
 


## expensesテーブル
|column|Type|Option|
|------|----|------|
|month_id|integer|
|year_id|integer|
|expensecategory_id|integer|
|money|integer|
|user|references|

### Association
- belongs_to :user
- belongs_to_active_hash :month
- belongs_to_active_hash :year
- belongs_to_active_hash :expensecategory


## incomeテーブル
|column|Type|Option|
|------|----|------|
|month_id|integer|
|year_id|integer|
|incomecategory_id|integer|
|money|integer|
|user|references|

### Association
- belongs_to :user
- belongs_to_active_hash :incomecategory
- belongs_to_active_hash :month
- belongs_to_active_hash :year



## memoテーブル
|column|Type|Option|
|------|----|------|
|user_id|integer|
|content|text|


### Association
- belongs_to :user



