class BusinessIntelligence
  def most_revenue(quantity)
    Merchant.joins(:invoices)
            .joins(:invoice_items)
            .joins(:sales)
            .select("merchants.id, merchants.name, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
            .where("sales.result='success' AND invoices.status='shipped'")
            .group("merchants.id")
            .order("revenue DESC")
            .limit(quantity)
  end

  def most_items(quantity)
    Merchant.joins(:invoices)
            .joins(:invoice_items)
            .joins(:sales)
            .select("merchants.id, merchants.name, sum(invoice_items.quantity) AS items_sold")
            .where("sales.result='success' AND invoices.status='shipped'")
            .group("merchants.id")
            .order("items_sold DESC")
            .limit(quantity)
  end

  def merchant_rev(id)
    Merchant.joins(:invoices)
            .joins(:invoice_items)
            .joins(:sales)
            .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
            .where("sales.result='success' AND invoices.status='shipped'")
            .group("merchants.id")
            .having("merchants.id=#{id}")
  end

  def revenue_between_dates(start_date, end_date)
    updated_at: Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day
    require "pry"; binding.pry
    Merchant.joins(:invoices)
            .joins(:invoice_item)
            .joins(:sales)
            .select("sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
            .where("sales.result='success' AND invoices.status='shipped'")
            
  end
end
