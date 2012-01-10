FactoryGirl.define do
  factory :company do |f|
    f.name{ "FuuBar #{rand 99999999}" }
  end

  factory :series do |f|
    f.name{ "FuuBar #{rand 9999999999}" }
    f.liquidation_order{ rand 999999 }
    f.association :company
  end

  factory :company_share do |f|
    f.shareholder_name 'Mr Fuu'
    f.number 10
    f.association :company
  end
end
