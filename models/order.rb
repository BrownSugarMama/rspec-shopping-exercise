class Order
  attr_reader :order_status
  attr_accessor :total_products

  def initialize
    @total_products = 0
  end

  def add_to_cart
    @total_products = @total_products + 1
  end

  def update_discount
    if @total_products > 5
      @discount = 0.20
    else
      @discount = 0
    end
  end

  def check_out
    @order_status = "complete"
  end

end
