FactoryBot.define do
  factory :post do
    title          {'鶯谷マンション'}
    station {'鶯谷駅'}
    price {60000}
    floor {'1LDK'}
    construction {'築20年'}
    access {'徒歩3分'}
    location {'東京都台東区鶯谷1-1'}
    build {'木造建築'}
    security {'玄関オートロック'}
    equipment {'家具完備'}
    facility {'風呂トイレ別'}
    
    
    association :owner

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
