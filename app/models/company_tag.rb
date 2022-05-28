class CompanyTag < ApplicationRecord
  belongs_to :company
  belongs_to :tag

  validates :company, uniqueness: { scope: :tag }
end

