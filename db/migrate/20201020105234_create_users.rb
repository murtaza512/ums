class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 100
      t.string :title, limit: 100
      t.string :email, null: false, index: { unique: true }, limit: 100
      t.string :phone, null: false, limit: 100
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
