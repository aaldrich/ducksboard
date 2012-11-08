require 'minitest_helper'

describe Ducksboard::Widget do
  let(:widget) { Ducksboard::Widget.new("label") }

  it "can receive data" do
    packet = {
      :value => 10
    }

    stub_request(:post, "http://push.ducksboard.com/values/label").
      with(:body => packet.to_json).
      to_return(:status => 200)

    response = widget << packet
    response.success?.must_equal true
  end
end
