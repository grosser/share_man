class Company < ActiveRecord::Base
  has_many :company_shares
  has_many :series
  accepts_nested_attributes_for :series

  validates :name, :presence => true, :uniqueness => true

  def to_param
    "#{id}-#{name.parameterize}"
  end
end