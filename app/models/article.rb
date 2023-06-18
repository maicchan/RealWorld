class Article < ApplicationRecord
  before_create :generate_slug

  validates :title, :description, :body, presence: true

  private

  def generate_slug
    self.slug = title.parameterize
  end

end
