class CreateTestdbs < ActiveRecord::Migration
  def up
    create_table :testdbs do |t|
    	t.column "nodeid", :string
      t.timestamps
    end
  end

  def down
    drop_table :testdbs
  end

  end
end