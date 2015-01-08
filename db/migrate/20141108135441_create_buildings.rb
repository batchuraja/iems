class CreateBuildings < ActiveRecord::Migration
  def up
    create_table :buildings do |t|
    	t.column "name", :string
      	t.timestamps
    end
  end

  def down
  	drop_table :buildings
  end
end