class ItemSearchResults
  def find_by_value(value)
    Item.all.find do |item|
      item.name.downcase.include?(value) || item.unit_price.to_s.include?(value) || item.created_at.to_s.include?(value) || item.updated_at.to_s.include?(value)
    end
  end

  def find_all_by_value(value)
    Item.all.find_all do |item|
      item.name.downcase.include?(value) || item.unit_price.to_s.include?(value) || item.created_at.to_s.include?(value) || item.updated_at.to_s.include?(value)
    end
  end
end
