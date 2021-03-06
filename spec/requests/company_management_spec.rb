require 'spec_helper'

describe "Company management" do
  it "allows me to create a new company" do
    visit "/companies"
    click_link 'New'
    fill_in 'company[name]', :with => 'NAME'
    lambda{
      click_button 'Create'
    }.should change{ Company.count }.by(+1)
    page.should have_content('NAME')
  end

  it "can add series to an existing company" do
    company = Factory(:company)
    visit "/companies"
    click_link company.name
    fill_in 'company[series_attributes][0][name]', :with => 'Series A'
    fill_in 'company[series_attributes][0][liquidation_order]', :with => '1'
    fill_in 'company[series_attributes][1][name]', :with => 'Series B'
    fill_in 'company[series_attributes][1][liquidation_order]', :with => '2'
    lambda{
      click_button 'Save'
    }.should change{ company.series.count }.by(+2)
    page.body.should include('Series A')
    page.body.should include('Series B')
  end


  it "can add shares to an existing company" do
    company = Factory(:company)
    series = Factory(:series, :company => company)
    visit "/companies/#{company.to_param}"
    fill_in 'company[company_shares_attributes][0][shareholder_name]', :with => 'Stakeholder A'
    fill_in 'company[company_shares_attributes][0][number]', :with => '10'
    fill_in 'company[company_shares_attributes][1][shareholder_name]', :with => 'Stakeholder B'
    fill_in 'company[company_shares_attributes][1][number]', :with => '10'
    select series.name, :from => 'company[company_shares_attributes][0][series_id]'

    lambda{
      click_button 'Save'
    }.should change{ company.company_shares.count }.by(+2)

    page.body.should include('Stakeholder A')
    page.body.should include('Stakeholder B')
  end
end

