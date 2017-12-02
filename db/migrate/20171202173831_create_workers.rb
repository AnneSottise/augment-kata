class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
    	t.string  :first_name, null: false
    	t.string  :status,     null: false

    	t.timestamps
    end
  end
end
