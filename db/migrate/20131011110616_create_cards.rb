class CreateCards < ActiveRecord::Migration
  def change
  	create_table :cards do |t|
  		t.integer :deck_id
  		t.string :answer
  		t.string :question 
  		t.timestamps
  	end
  end
end
