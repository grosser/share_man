class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find params[:id].to_i
    5.times{ @company.series.build }
    render 'edit'
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to @company, :notice => :default
    else
      flash[:alert] = :default
      render 'new'
    end
  end

  def update
    @company = Company.find params[:id].to_i
    cleanup_nested :series_attributes, :name
    cleanup_nested :company_shares_attributes, :shareholder_name

    if @company.update_attributes(params[:company])
      redirect_to @company, :notice => :default
    else
      flash[:alert] = :default
      render 'edit'
    end
  end

  private

  def cleanup_nested(attribute_name, field)
    nested_attributes = params[:company][attribute_name] || {}
    nested_attributes.each do |k,attributes|
      nested_attributes.delete(k) if attributes[field].blank?
    end
  end
end