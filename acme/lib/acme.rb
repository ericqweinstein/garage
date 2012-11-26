class Acme
  def made_by_acme?(product)
    if product.to_s.match(/[aA]cme/)
      true
    else
      false
    end
  end
end
