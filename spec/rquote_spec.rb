$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/../lib"))

require 'redgreen'
require 'rquote'

describe Rquote do

  before do
    @collector = Rquote.new
  end
  
  context "with good parameters" do
    before do
     Net::HTTP.stub!(:get).and_return('471.37,+2.64,23423423')
    end
  
    it "should return proper data array" do
      @collector.find('msft').should be_kind_of(Array) 
    end

    it "should return proper url for given symbols" do
      @collector.send(:construct_args,'msft,googl').should eql '?f=l1c1v&s=msft%2Cgoogl'
    end
  end

end
