require "spec_helper"

describe "user resource" do
  describe "routing api calls" do
    it "routes to #index" do
      expect(get("/api/users.json")).to route_to("users#index", format: "json")
    end

    it "routes to #new" do
      expect(get("/api/users/new.json")).to route_to("users#new", format: "json")
    end

    it "routes to #show" do
      expect(get("/api/users/1.json")).to route_to("users#show", :id => "1", format: "json")
    end

    it "routes to #edit" do
      expect(get("/api/users/1/edit.json")).to route_to("users#edit", :id => "1", format: "json")
    end

    it "routes to #create" do
      expect(post("/api/users.json")).to route_to("registrations#create", format: "json")
    end

    it "routes to #update" do
      expect(put("/api/users/1.json")).to route_to("users#update", :id => "1", format: "json")
    end

    it "routes to #destroy" do
      expect(delete("/api/users/1.json")).to route_to("users#destroy", :id => "1", format: "json")
    end
  end
end
