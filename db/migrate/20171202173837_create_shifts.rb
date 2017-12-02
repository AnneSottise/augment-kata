class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
    	t.references :worker,      null: false
    	t.datetime   :start_date,  null: false
    	t.integer    :price_cents

    	t.timestamps
    end
  end
end
