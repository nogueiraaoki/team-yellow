json.extract! product, :id, :name, :code, :price, :quantity, :kind, :photo_url, :created_at, :updated_at
json.url product_url(product, format: :json)
