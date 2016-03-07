require "rspec"
require_relative "../models/product"

describe Product do
  let(:product){Product.new("MacBook Pro", 1200)}

  it "belongs to a class Product" do
    expect(product).to be_a(Product)
  end
  it "has a String for a title" do
    expect(product.title).to be_a(String)
  end
  it "has has a price as an Integer" do
    expect(product.cost).to eq(1200)
  end
  it "contains a list of reviews" do
    expect(product.reviews).to be_a(Array)
  end

  describe "#read_product_info" do
    context "when we read over our product's info" do
      it "should print out a string with it's title and cost" do
        expect(product.read_product_info).to eq("#{product.title} currently costs #{product.cost}")
      end
    end
  end

  describe "#add_review" do
    context "when we add a review" do
      it "should add a review into our list" do
        expect{product.add_review("this is awesome")}.to change{product.reviews.length}.by(1)
      end
    end
  end

  describe "#read_reviews" do
    context "when we are reading a product's review" do
      context "if there are more than 10 reviews" do
        it "the product's reliability is strong" do
          11.times do
            product.add_review("New Review")
          end
          product.read_reviews
          expect(product.reliability).to eq("strong")
        end
      end
      context "if there are more than 5 reviews" do
        it "the product's reliability is okay" do
          6.times do
            product.add_review("New Review")
          end
          product.read_reviews
          expect(product.reliability).to eq("okay")
        end
      end
      context "if there are less than 5 reviews" do
        it "the product's reliability is weak" do
          product.read_reviews
          expect(product.reliability).to eq("weak")
        end
      end
    end
  end

end
