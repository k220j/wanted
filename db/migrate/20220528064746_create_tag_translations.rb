class CreateTagTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_translations do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.string :name, null: false
      t.timestamps
    end

    add_index :tag_translations, [:name, :tag_id, :language_id], name: :index_tag_translations_on_tag_and_name, unique: true
  end
end
