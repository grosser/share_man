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
    series_attributes = params[:company][:series_attributes] || []
    series_attributes.each do |k,attributes|
      series_attributes.delete(k) if attributes[:name].blank?
    end

    if @company.update_attributes(params[:company])
      redirect_to @company, :notice => :default
    else
      flash[:alert] = :default
      render 'edit'
    end
  end
end