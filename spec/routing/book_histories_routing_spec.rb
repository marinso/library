require "rails_helper"

RSpec.describe BookHistoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/book_histories").to route_to("book_histories#index")
    end

    it "routes to #new" do
      expect(:get => "/book_histories/new").to route_to("book_histories#new")
    end

    it "routes to #show" do
      expect(:get => "/book_histories/1").to route_to("book_histories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/book_histories/1/edit").to route_to("book_histories#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/book_histories").to route_to("book_histories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/book_histories/1").to route_to("book_histories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/book_histories/1").to route_to("book_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/book_histories/1").to route_to("book_histories#destroy", :id => "1")
    end
  end
end
