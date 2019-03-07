days = []
range = (@goal.created_at.to_date .. @goal.end_at.to_date)

x = (@goal.quantity/User.all.count.to_f)/range.count
y = 0
z = 0
json.ideal range.map{|s|y += x}
json.atual range.map{|s|z += @donates.select{|d|d.created_at.to_date == s}.map{|s|s.product.quantity * s.quantity.to_f}.sum}
json.labels range.map{|s|l s, format: '%d/%m/%Y'}