require "prerequisites"

describe Prerequisites do
  
  before :all do
    @prereq = Prerequisites.new
  end
  
  it "should order classes" do
    @prereq.orderClasses([]).should == []
  end

end