class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false, default: ""
      t.text :description,            null: false, default: ""
      t.interger :category_id ,       null: false, default: ""
      t.interger :status_id,          null: false, default: ""
      t.interger :shipping_cost_id,   null: false, default: ""
      t.interger :shipping_source_id, null: false, default: ""
      t.interger :delivery_date_id,   null: false, default: ""
      t.interger :price,              null: false, default: ""
      t.references :user,             null: false, foreign_key: true,default: ""
      t.timestamps
    end
  end
end
