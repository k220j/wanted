class CreateCompanyTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :company_translations do |t|
      t.references :company, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.string :name, null: false
      t.timestamps
    end

    add_index :company_translations, [:name, :company_id, :language_id], name: :index_company_translations_on_comapny_and_name, unique: true
  end
end
