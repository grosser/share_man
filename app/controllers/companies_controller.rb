class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
    5.times{ @company.company_shares.build }
  end

  def create

  end
end