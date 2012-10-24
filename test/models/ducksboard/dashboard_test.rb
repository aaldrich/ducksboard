require 'minitest_helper'

describe Ducksboard::Dashboard do
  it "has the correct api url" do
    Ducksboard::Dashboard.base_uri == "app.ducksboard.com/api"
  end

  describe "#all" do
    before do
      @slug = "my-dashboard"
      @response = <<-JSON
        {
          "count": 1,
          "data":
            [{
                "name": "my dashboard",
                "background": "wood",
                "layout": 1,
                "slug": "#{@slug}"
            }]
        }
      JSON
    end

    it "returns a list of dashboards" do
      stub_request(:get, "http://app.ducksboard.com/api/dashboards").to_return(:body => @response)
      dashboards = Ducksboard::Dashboard.all
      dashboards.size.must_equal 1
      dashboards.first.slug.must_equal @slug
    end
  end

  describe "#find" do
    before do
      @slug = "my-dashboard"
      @response = <<-JSON
        {
          "name": "my dashboard",
          "background": "wood",
          "layout": 1,
          "slug": "#{@slug}"
        }
      JSON
    end

    it "returns a dashboard object" do
      stub_request(:get, "http://app.ducksboard.com/api/dashboards/#{@slug}").to_return(:body => @response)
      dashboard = Ducksboard::Dashboard.find(@slug)
      dashboard.name.must_equal "my dashboard", dashboard.inspect
    end
  end
end
