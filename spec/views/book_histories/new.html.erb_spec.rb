require 'rails_helper'

RSpec.describe "book_histories/new", type: :view do
  before(:each) do
    assign(:book_history, BookHistory.new(
      :belongs_to => "",
      :belongs_to => ""
    ))
  end

  it "renders new book_history form" do
    render

    assert_select "form[action=?][method=?]", book_histories_path, "post" do

      assert_select "input[name=?]", "book_history[belongs_to]"

      assert_select "input[name=?]", "book_history[belongs_to]"
    end
  end
end
