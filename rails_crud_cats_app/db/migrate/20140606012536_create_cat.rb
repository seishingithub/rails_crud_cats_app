class CreateCat < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :color
    end
  end
end
