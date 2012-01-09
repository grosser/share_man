FactoryGirl.define do
  factory :company do |f|
    f.name 'FuuBar'
  end

  factory :series do |f|
    f.name 'FuuBar'
    f.liquidation_order 1
    f.association :company
  end
end
