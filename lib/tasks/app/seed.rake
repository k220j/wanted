require "csv"

namespace :app do
  namespace :seed do
    desc "initial set"
    task init: :environment do

      %w(ko en ja).each do |ln|
        Language.create(code: ln)
      end

      ko = Language.find_by(code: "ko")
      en = Language.find_by(code: "en")
      ja = Language.find_by(code: "ja")

      def create_company_translations(company, name, ln)
        return if name.nil?

        company.translations.create!(name: name, language: ln)
      end

      def create_tag_translations(ko_names, en_names, ja_names)
        ko_names = ko_names.split("|")
        en_names = en_names.split("|")
        ja_names = ja_names.split("|")
        tags = []

        ko_names.each_with_index do |name, idx|
          tag = Tag.create!
          tag.translations.create!(name: ko_names[idx], language: Language.find_by(code: "ko"))
          tag.translations.create!(name: en_names[idx], language: Language.find_by(code: "en"))
          tag.translations.create!(name: ja_names[idx], language: Language.find_by(code: "ja"))

          tags << tag
        end

        tags
      end

      CSV.read(Rails.root.join("wanted_temp_data.csv")).each_with_index do |row, idx|
        next if idx == 0

        company = Company.create!

        create_company_translations(company, row[0], ko)
        create_company_translations(company, row[1], en)
        create_company_translations(company, row[2], ja)

        tags = create_tag_translations(row[3], row[4], row[5])
        tags.each do |tag|
          CompanyTag.create!(company: company, tag: tag)
        end
      end
    end
  end
end
