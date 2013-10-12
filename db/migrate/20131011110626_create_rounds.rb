class CreateRounds < ActiveRecord::Migration
  def change
  	create_table :rounds do |t|
  		t.integer :user_id 
  		t.integer :deck_id
  		t.integer :score, default: 0
  		t.integer :count, default: 0
  		t.string :result
  		t.timestamps
  	end
  end
end
