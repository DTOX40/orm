require_relative './models/produto'

p = Produto.new

puts p.methods - Class.methods