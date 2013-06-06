class Product < ActiveRecord::Base
  has_many :line_items
  attr_accessible :description, :image_url, :price, :title, :line_items


  validates :description, :title, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true, length: {minimum: 10}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)$}i,
    message: 'Must be a valid URL for a gif, png, or jpg..'
  }

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items Present')
      return false
    end
  end
end
