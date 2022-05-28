class CreateCompanyTags < ActiveRecord::Migration[7.0]
  def change
    create_table :company_tags do |t|
      t.references :company, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :company_tags, [:tag_id, :company_id], unique: true
  end
end
