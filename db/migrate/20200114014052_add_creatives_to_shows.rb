class AddCreativesToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :playwright, :string
    add_column :shows, :book, :string
    add_column :shows, :music, :string
    add_column :shows, :lyrics, :string
    add_column :shows, :concept, :string
  end
end
