class AddAuthorSubtitleAndReadToBooks < ActiveRecord::Migration
  def change
    add_column :books, :author, :string
    add_column :books, :sub_title, :string
    add_column :books, :read, :boolean
  end
end
