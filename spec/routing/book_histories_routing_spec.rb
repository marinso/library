require "rails_helper"

RSpec.describe BookHistoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/book_histories").to route_to("book_histories#index")
    end
  end
end
