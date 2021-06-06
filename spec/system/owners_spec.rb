require 'rails_helper'

RSpec.describe "Owners", type: :system do
  before do
    ＠owner = FactoryBot.build(:owner)
  end

  context 'オーナーが新規登録できるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
    end
  end
end
