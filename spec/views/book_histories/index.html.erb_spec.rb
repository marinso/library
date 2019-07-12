require 'rails_helper'

RSpec.describe "book_histories/index", type: :view do
  before(:each) do
    assign(:book_histories, [
      BookHistory.create!(
        :belongs_to => "",
        :belongs_to => ""
      ),
      BookHistory.create!(
        :belongs_to => "",
        :belongs_to => ""
      )
    ])
  end

  it "renders a list of book_histories" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
