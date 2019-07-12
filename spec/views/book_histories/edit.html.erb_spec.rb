require 'rails_helper'

RSpec.describe "book_histories/edit", type: :view do
  before(:each) do
    @book_history = assign(:book_history, BookHistory.create!(
      :belongs_to => "",
      :belongs_to => ""
    ))
  end

  it "renders the edit book_history form" do
    render

    assert_select "form[action=?][method=?]", book_history_path(@book_history), "post" do

      assert_select "input[name=?]", "book_history[belongs_to]"

      assert_select "input[name=?]", "book_history[belongs_to]"
    end
  end
end
