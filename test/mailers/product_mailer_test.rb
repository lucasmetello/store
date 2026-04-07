require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    product    = Product.new(name: "T-Shirt")
    subscriber = User.new(email: "chris@example.org")

    mail = ProductMailer.with(product: product, subscriber: subscriber).in_stock

    assert_equal "In stock", mail.subject
    assert_equal [ "chris@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
