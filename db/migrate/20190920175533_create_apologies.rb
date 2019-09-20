class CreateApologies < ActiveRecord::Migration[5.2]
  def change
    create_table :apologies do |t|
      t.text :content

      t.timestamps
    end
  end
end
