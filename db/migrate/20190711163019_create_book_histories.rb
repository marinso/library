class CreateBookHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_histories do |t|
      t.integer :user_id
      t.integer :book_id
      t.date :check_out_date
      t.date :check_in_date

      t.timestamps
    end
  end
end
