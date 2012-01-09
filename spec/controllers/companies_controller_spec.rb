require 'spec_helper'

describe CompaniesController do
  describe "#new" do
    it "renders" do
      get :new
      response.should render_template 'new'
    end
  end

  describe "#create" do
    it "creates a company and redirects" do
      post :create, :company => {:name => 'Starter'}
      Company.last.name.should == 'Starter'
      response.should redirect_to "/companies/#{Company.last.to_param}"
      flash[:notice].should_not be_blank
    end

    it "fails to create an invalid company" do
      lambda{
        post :create, :company => {:name => ''}
      }.should_not change{ Company.count }
      response.should render_template 'new'
      flash[:alert].should_not be_blank
    end
  end

  describe "#show" do
    it "shows" do
      get :show, :id => Factory(:company).to_param
      response.should render_template 'edit'
    end
  end


  describe "#update" do
    let(:company){ Factory(:company) }

    it "updates a company and redirects" do
      lambda{
        put :update, :id => company.to_param, :company => {:name => 'Starter'}
      }.should change{ company.reload.name }
      response.should redirect_to "/companies/#{Company.last.to_param}"
      flash[:notice].should_not be_blank
    end

    it "fails to updates an invalid company" do
      lambda{
        put :update, :id => company.to_param, :company => {:name => ''}
      }.should_not change{ company.name }
      response.should render_template 'edit'
      flash[:alert].should_not be_blank
    end

    it "saves nested series" do
      lambda{
        put :update, :id => company.to_param, :company => {:series_attributes => {'0' => {:name => 'Foo', :liquidation_order => '1'}}}
      }.should change{ company.series.count }.by(+1)
    end

    it "does not care about series without names" do
      lambda{
        put :update, :id => company.to_param, :company => {:series_attributes => {'0' => {:name => ''}}}
      }.should_not change{ company.series.count }
    end
  end
end
