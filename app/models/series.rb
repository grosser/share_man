class Series < ActiveRecord::Base
  validates :liquidation_order, :presence => true
  validates_uniqueness_of :liquidation_order, :scope => :company_id

  belongs_to :company
end