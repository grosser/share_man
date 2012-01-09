FactoryGirl.define do
  factory :company do |f|
    f.name 'FuuBar'
  end

  factory :series do |f|
    f.name 'FuuBar'
    f.liquidation_order 1
    f.association :company
  end

  factory :company_share do |f|
    f.shareholder_name 'Mr Fuu'
    f.number 10
    f.association :company
  end
end
