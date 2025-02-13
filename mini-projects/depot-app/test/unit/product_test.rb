require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "Product should be invalid with empty attributes.." do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "Price must be positive" do
    product = Product.new(title:       'My book title',
                          description: 'yyy',
                          image_url:   'zzz.jpg')

    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title:       "My book title",
                description: "yyy",
                price:       1,
                image_url:   image_url)
  end

  test "image url" do
    ok  = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/tes/fred.giF }
    bad = %w{ fred.doc fred.jpg/more fred.gif.more }

    ok.each do |t|
      assert new_product(t).valid?, "#{t} shouldn't be invalid"
    end

    bad.each do |t|
      assert new_product(t).invalid?, "#{t} should be invalid"
    end
  end

  test "unique title" do
    product = Product.new(title:       products(:ruby).title,
                          description: 'yyy',
                          price:       1,
                          image_url:   "fred.gif")

    assert !product.save
    # puts product.errors[:title].join('; ')
    assert_equal "has already been taken", product.errors[:title].join('; ')
  end

  test "Title length >= 10" do
    product = Product.new(title:       "notlong",
                          description: 'yyy',
                          price:       1,
                          image_url:   "fred.gif")

    assert !product.save
    assert_equal product.errors[:title].join('; '), "is too short (minimum is 10 characters)"

    product.title = "A title that is long enough.."
    assert product.valid?, "Product should be valid..."
  end
end
