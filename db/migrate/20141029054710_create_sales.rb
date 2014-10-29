class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :name
      t.decimal :total
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
