class CompanyShare < ActiveRecord::Base
  belongs_to :company
  belongs_to :series
end