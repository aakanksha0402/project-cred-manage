class CreateCredentialKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :credential_keys do |t|
      t.references :credential, foreign_key: true
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
