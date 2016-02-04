require 'spec_helper'

module Adobe
  describe DigitalPublishingSolution do
    it "has a version number" do
      ::Adobe::DigitalPublishingSolution::VERSION.wont_be_nil
    end
  end
end
