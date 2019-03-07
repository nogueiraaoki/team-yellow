json.labels @products.map{|s|s.name}
json.values @products.map{|s|s.donates.map{|c|c.quantity * s.quantity}.sum}
