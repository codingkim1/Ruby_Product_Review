class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def reviews
      Review.where(user_id: id)
    end

    def products
      Product.joins(:reviews).where(reviews: { user_id: id })
    end

    def favorite_product 
      products.order(reviews: :desc).first
    end
    
    def remove_reviews(product)
      reviews.where(product_id: product.id).destroy_all
    end 
end 