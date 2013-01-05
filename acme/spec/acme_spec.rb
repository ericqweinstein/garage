require './lib/acme'

describe Acme do
  it "should check whether a product is made by Acme" do
    @acme = Acme.new
    @acme.made_by_acme?("Acme").should == true
    @acme.made_by_acme?("acme").should == true
    @acme.made_by_acme?("Wile E. Coyote").should == false
  end
end
