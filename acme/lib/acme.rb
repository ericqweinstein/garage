class Acme
  def made_by_acme?(product)
    product.to_s.match(/[aA]cme/) ? true : false
  end
end
