class CreateCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :credentials do |t|
      t.string :name
      t.references :project_environment, foreign_key: true
      t.string :provider_name
      t.string :URL
      t.integer :role

      t.timestamps
    end
  end
end
