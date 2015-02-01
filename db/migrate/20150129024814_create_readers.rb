class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.timestamps
    end
  end
end
