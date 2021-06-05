class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.timestamps
      t.string :title, null:false#物件名
      t.string :station, null:false#最寄り駅
      t.integer :price, null:false#家賃
      t.string :floor, null:false#間取り
      t.string :construction, null:false#築年数
      t.string :access, null:false#アクセス
      t.string :location, null:false#所在地
      t.string :build, null:false#建物構造
      t.string :security, null:false#セキュリティー
      t.string :equipment, null:false#備品
      t.string :facility, null:false#設備
      t.references :owner, null: false, foreign_key: true
    end
  end
end