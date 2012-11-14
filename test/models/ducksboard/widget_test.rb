require 'minitest_helper'

describe Ducksboard::Widget do
  let(:widget) { Ducksboard::Widget.new({"id" => "label"}) }
  let(:widget_object) {
    JSON.parse(<<-DATA)
      {
      "widget":  {
      "id": 921,
      "kind": "github_watchers_counter_timeline",
      "title": "api example watchers",
      "dashboard": "ducksboard-internal",
      "row": 1,
      "column": 1,
      "sound": true
    },
      "slots":   {
      "1": {
      "subtitle" : "watchers",
      "timespan" : "monthly",
      "color" : "#C11F70",
      "label" : "782"
    },
      "2": {
    }
    },
      "content": {
      "account_id": 5,
      "user": "ducksboard",
      "repo": "api-examples"
    }
    }
  DATA
  }

  it "initializes on find" do
    widget = Ducksboard::Widget.find("something")
    widget.id.must_equal "something"
  end

  it "can get all widgets" do
    packet = {
      "count" => 1,
      "data" => [widget_object]
    }

    stub_request(:get, "https://:x@app.ducksboard.com/api/widgets").
      to_return(:status => 200, :body => packet.to_json)

    response = Ducksboard::Widget.all
    response.first.id.must_equal 921
  end

  it "can send data" do
    packet = {
      :value => 10
    }

    stub_request(:post, "https://:x@push.ducksboard.com/values/label").
      with(:body => packet.to_json).
      to_return(:status => 200)

    response = widget << packet
    response.success?.must_equal true
  end
end
