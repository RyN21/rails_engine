class RevenueSerializer
  def self.handroll(json)
    {
      "data" => {
        "id" => nil,
        "attributes" => {
          "revenue" => json.first["revenue"].round(2)
        }
      }
    }
  end
end
