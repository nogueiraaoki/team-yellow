json.acts @acts.map{|s|s.goal_records.map{|s|s.quantity}}.flatten!
json.labels @acts.map{|s|s.goal_records.map{|s|s.name}}.flatten!
json.atual @acts.map{|s|s.donates.map{|s|s.product.quantity * s.quantity.to_f}.sum}