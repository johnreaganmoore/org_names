class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :url
      t.string :name
      t.integer :name_score

      t.timestamps null: false
    end
  end
end
