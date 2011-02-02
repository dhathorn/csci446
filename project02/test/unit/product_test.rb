require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  fixtures :products

  test "unique title" do
	  product = Product.new(:title => products(:ruby_book).title, :price => 1, :description => "yyy", :image_url => "zzz.jpg")
	  assert !product.save
	  assert_equal I18n.t('activerecord.errors.messages.taken'), product.errors.on(:title)
  end

  test "positive price" do
	  product = Product.new(:title => "falala", :description => "yyy", :image_url => "zzz.jpg")
	  product.price = -1
	  assert !product.valid?
	  assert_equal "should be at least 0.01", product.errors.on(:price)

	  product.price = 0
	  assert !product.valid?
	  assert_equal "should be at least 0.01", product.errors.on(:price)

	  product.price =1
	  assert product.valid?
  end
  test "i url" do
	  ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
	  bad = %w{ fred.doc fred.gif/more fred.gif.more }
	  
	  ok.each do |name|
		  product = Product.new(:title => "falala",:price => 1, :description => "yyy", :image_url => name)
		  assert product.valid?, product.errors.full_messages
	  end
	  bad.each do |name|
		  product = Product.new(:title => "falala",:price => 1, :description => "yyy", :image_url => name)
		  assert !product.valid?, "saving ${name}"
	  end
  end


  test "invalid when attrs are empty" do
	product = Product.new
	assert !product.valid?
	assert product.errors.invalid?(:title)
	assert product.errors.invalid?(:description)
	assert product.errors.invalid?(:price)
	assert product.errors.invalid?(:image_url)
  end

  test "the truth" do
    assert true
  end
end
