require "spec_helper"

describe "root route" do
  it "routes to tasks#index" do
    expect(get("/")).to route_to("tasks#index")
  end
end
