require 'rails_helper'

RSpec.describe "book_histories/show", type: :view do
  before(:each) do
    @book_history = assign(:book_history, BookHistory.create!(
      :belongs_to => "",
      :belongs_to => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
