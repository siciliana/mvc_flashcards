class CreateRounds < ActiveRecord::Migration
  def change
  	create_table :rounds do |t|
  		t.integer :user_id 
  		t.integer :deck_id
  		t.integer :score, default: 0
  		t.integer :counter, default: 0
  		t.string :result
      t.boolean :complete, default: false 
  		t.timestamps
  	end
  end
end
