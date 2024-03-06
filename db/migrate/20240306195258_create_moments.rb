class CreateMoments < ActiveRecord::Migration[7.1]
  def change
    create_table :moments do |t|
      t.string :wassup
      t.string :gif_url

      t.timestamps
    end
  end
end
