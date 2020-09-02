class MerchantSearchResults
  def find_by_value(value)
    Merchant.all.find do |merch|
      merch.name.include?(value) || merch.created_at.include?(value) || merch.updated_at.include?(value)
    end
  end

  def find_all_by_value(value)
    Merchant.all.find_all do |merch|
      merch.name.include?(value) || merch.created_at == value || merch.updated_at == value
    end
  end
end
