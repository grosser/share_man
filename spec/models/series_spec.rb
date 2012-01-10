require 'spec_helper'

describe Series do
  describe "validations" do
    it "is invalid with duplicate liquidation order" do
      series = Factory(:series)
      Factory.build(:series, :liquidation_order => series.liquidation_order, :company => series.company).valid?.should == false
    end

    it "is valid with duplicate liquidation order on different company" do
      series = Factory(:series)
      Factory.build(:series, :liquidation_order => series.liquidation_order).valid?.should == true
    end
  end
end