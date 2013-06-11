require "spec_helper"

describe "root route" do
  it "routes to tasks" do
    expect(get("/")).to route_to("home#index")
  end
end
