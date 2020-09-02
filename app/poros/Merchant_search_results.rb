class MerchantSearchResults
  def find_by_value(value)
    Merchant.all.find do |merch|
      merch.name.downcase.include?(value) || merch.created_at.to_s.include?(value) || merch.updated_at.to_s.include?(value)
    end
  end

  def find_all_by_value(value)
    Merchant.all.find_all do |merch|
      merch.name.downcase.include?(value) || merch.created_at.to_s.include?(value) || merch.updated_at.to_s.include?(value)
    end
  end
end
