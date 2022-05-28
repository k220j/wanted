class Company < ApplicationRecord
  has_many :translations, class_name: "CompanyTranslation"
  has_many :company_tags
  has_many :tags, through: :company_tags
end

