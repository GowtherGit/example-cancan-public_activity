class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :product, index: true
      t.belongs_to :sale, index: true
      t.decimal :quantity
      t.decimal :total

      t.timestamps
    end
  end
end
