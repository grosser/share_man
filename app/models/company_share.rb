class CompanyShare < ActiveRecord::Base
  belongs_to :company
  belongs_to :series

  validates :number, :presence => true
  validates :purchased_on, :presence => true
end