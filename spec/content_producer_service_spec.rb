require 'spec_helper'

module Adobe
  describe ContentProducerService do
    it "has a version number" do
      ::Adobe::ContentProducerService::VERSION.wont_be_nil
    end
  end
end
