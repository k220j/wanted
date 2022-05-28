class TagTranslation < ApplicationRecord
  belongs_to :tag
  belongs_to :language

  validates :name, presence: true, uniqueness: { scope: %i(tag language)}
end

