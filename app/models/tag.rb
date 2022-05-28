class Tag < ApplicationRecord
  has_many :translations, :class_name => "TagTranslation"
  has_many :company_tags

  has_many :companies, through: :company_tags
end
