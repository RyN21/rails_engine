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
end
