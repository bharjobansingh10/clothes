require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'creates an product' do
    Product.create(
      name: 'ABC',
      description: 'test content',
      price: 50.5,
      is_featured: false
    )
    expect(Product.count).to eq(1)
  end

  context 'negative cases' do
    it 'fails if name is greator than 30 characters ' do
      product = Product.create(
        name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  aaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
      )
      expect(
        product.errors.messages[:name]
      ).to eq(["can't be more than 30 characters"])
    end

    it 'fails if price is nit present' do
      product = Product.create(
        title: 'ABC'
      )
      expect(
        product.errors.messages[:price]
      ).to eq(['is required'])
    end
  end
end