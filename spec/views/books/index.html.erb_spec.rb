require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :title => "Title",
        :description => "MyText",
        :author => "Author",
        :isbn => "Isbn",
        :status => "Status"
      ),
      Book.create!(
        :title => "Title",
        :description => "MyText",
        :author => "Author",
        :isbn => "Isbn",
        :status => "Status"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
