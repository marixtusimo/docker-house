require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '物件投稿' do
    context '新規投稿できるとき' do
      it 'すべての情報が入力されていなければ投稿できない' do
        expect(@post).to be_valid
      end
    end

    context '新規投稿できないとき' do
      it 'titleが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'stationが空では投稿できない' do
        @post.station = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Station can't be blank")
      end
      it 'priceが空では投稿できない' do
        @post.price = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角では投稿できない' do
        @post.price = '２００００００'
        @post.valid?
        expect(@post.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが10000以下では投稿できない' do
        @post.price = '9999'
        @post.valid?
        expect(@post.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが9_999_999以上では投稿できない' do
        @post.price = '100000000'
        @post.valid?
        expect(@post.errors.full_messages).to include("Price is not included in the list")
      end

      it 'floorが空では投稿できない' do
        @post.floor = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Floor can't be blank")
      end
      it 'constructionが空では投稿できない' do
        @post.construction = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Construction can't be blank")
      end
      it 'accessが空では投稿できない' do
        @post.access = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Access can't be blank")
      end
      it 'locationが空では投稿できない' do
        @post.location = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Location can't be blank")
      end
      it 'buildが空では投稿できない' do
        @post.build = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Build can't be blank")
      end
      it 'securityが空では投稿できない' do
        @post.security = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Security can't be blank")
      end
      it 'facilityが空では投稿できない' do
        @post.facility = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Facility can't be blank")
      end
      it 'equipmentが空では投稿できない' do
        @post.equipment = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Equipment can't be blank")
      end
      it 'imageが空では投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
