require 'minitest_helper'

describe Ducksboard::HTTPPush do
  before do
    @response = { "response" => "ok" }
    @label = "label"
  end
  let(:push) { Ducksboard::HTTPPush.new(@label)}
  
  it "has a label" do
    push.label.must_equal "label"
  end

  it "returns a response" do
    packet = { :value => 100 }

    stub_request(:post, "https://:x@push.ducksboard.com/values/#{@label}").
    with(:body => packet.to_json).to_return(:status => 200, :body => @response.to_json)

    response = push.push(packet)
    response.instance_of?(Ducksboard::Response)
  end

  it "can push a single packet" do
    packet = { :value => 100 }

    stub_request(:post, "https://:x@push.ducksboard.com/values/#{@label}").
    with(:body => packet.to_json).to_return(:status => 200, :body => @response.to_json)

    response = push.push(packet)
    response.success?.must_equal true
  end

  it "can push multiple packets" do
    packet = [{ :value => 100 }, { :value => 101 }]

    stub_request(:post, "https://:x@push.ducksboard.com/values/#{@label}").
    with(:body => packet.to_json).to_return(:status => 200, :body => @response.to_json)
    response = push.push(packet)
    response.success?.must_equal true
  end
end
