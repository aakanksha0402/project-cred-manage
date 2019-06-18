class CreateProjectEnvironments < ActiveRecord::Migration[5.2]
  def change
    create_table :project_environments do |t|
      t.integer :name
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
