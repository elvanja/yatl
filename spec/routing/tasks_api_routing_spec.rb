require "spec_helper"

describe TasksController do
  context "ruoting api calls" do
    it "routes to #index" do
      expect(get("/api/tasks.json")).to route_to("tasks#index", format: "json")
    end

    it "routes to #new" do
      expect(get("/api/tasks/new.json")).to route_to("tasks#new", format: "json")
    end

    it "routes to #show" do
      expect(get("/api/tasks/1.json")).to route_to("tasks#show", :id => "1", format: "json")
    end

    it "routes to #edit" do
      expect(get("/api/tasks/1/edit.json")).to route_to("tasks#edit", :id => "1", format: "json")
    end

    it "routes to #create" do
      expect(post("/api/tasks.json")).to route_to("tasks#create", format: "json")
    end

    it "routes to #update" do
      expect(put("/api/tasks/1.json")).to route_to("tasks#update", :id => "1", format: "json")
    end

    it "routes to #destroy" do
      expect(delete("/api/tasks/1.json")).to route_to("tasks#destroy", :id => "1", format: "json")
    end
  end
end
