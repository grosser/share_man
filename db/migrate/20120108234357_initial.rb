class Initial < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.string :name, :null => false
      t.timestamps
    end

    create_table :company_shares do |t|
      t.integer :number, :null => false
      t.date :purchased_on
      t.integer :company_id, :null => false
      t.integer :series_id, :null => false
      t.timestamps
    end

    create_table :series do |t|
      t.string :name, :null => false
      t.decimal :liquidation_amount_per_share, :precision => 7, :scale => 5
      t.integer :liquidation_order, :null => false
      t.boolean :participation, :null => false, :default => false
      t.decimal :participation_cap, :precision => 7, :scale => 5
    end
  end

  def down
    drop_table :companies
    drop_table :series
    drop_table :company_shares
  end
end