require File.dirname(__FILE__) + '/../lib/phone_code.rb'

describe PhoneCode do
  before(:all) do
    RAILS_ROOT = File.dirname(__FILE__) + '/../../../..'
  end
  
  it "should load a bunch of countries" do
    PhoneCode.options_for_select.size.should == 260
  end
  
  it "should format the phone code correctly" do
    PhoneCode.options_for_select.first.should == ['1 United States of America', 1]
  end
  
  it "should accept one argument" do
    PhoneCode.options_for_select(:prefix).first.should == ['1', 1]
  end
  
  it "should flip stuff around" do
    PhoneCode.options_for_select(:country, :prefix).first.should == ['United States of America 1', 1]
  end
end