class Language < ApplicationRecord
  has_many :company_translations

  validates :code, presence: true, uniqueness: true
end
