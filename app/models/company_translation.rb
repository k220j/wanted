class CompanyTranslation < ApplicationRecord
  belongs_to :company
  belongs_to :language

  validates :name, presence: true, uniqueness: { scope: %i(company language)}
end

