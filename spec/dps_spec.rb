require 'spec_helper'

module Adobe
  describe DPS do
    it "has a version number" do
      ::Adobe::DPS::VERSION.wont_be_nil
    end

    it "includes HTTParty methods" do
      ::Adobe::DPS.must_include HTTParty
    end
  end
end
