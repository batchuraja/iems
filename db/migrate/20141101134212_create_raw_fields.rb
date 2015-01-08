class CreateRawFields < ActiveRecord::Migration
  def up
    create_table :raw_fields do |t|
    	t.column "nodeid", :string, :limit => 20
    	t.column "datetime", :datetime
    	t.column "valuearray", :string, :limit =>300
      t.timestamps
    end
  end

  def down
  	drop_table :raw_fields
  end
end