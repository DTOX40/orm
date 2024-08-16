require_relative './models/produto'
require_relative './models/fornecedor'
require 'terminal-table'

# Inicializa um novo produto
p = Produto.new

puts "======= Metodos e atributos de instancia ======="
puts p.methods - Class.methods
puts "======= Metodos e atributos de classe ======="
puts Produto.methods - Class.methods

# Define atributos para o produto
p.nome = "Abacaxi"
puts p.inspect

# Carrega todos os produtos
produtos = Produto.todos

# Mapeia os produtos para a tabela
rows = produtos.map do |produto|
  [
    produto.nome,
    produto.id,
    produto.descricao,
    produto.preco,
    produto.estoque,
    produto.fornecedor_id,
  ]
end

# Cria a tabela com cabeçalhos para produtos
table = Terminal::Table.new do |t|
  t.headings = ['nome', 'id', 'descricao', 'preco', 'estoque', 'fornecedor_id']
  t.rows = rows
end

# Exibe a tabela de produtos no console
puts table

puts "\n\n\n"  # Corrige a quebra de linha

# Carrega todos os fornecedores
fornecedores = Fornecedor.todos

# Cria a tabela com cabeçalhos para fornecedores
table = Terminal::Table.new do |t|
  t.headings = ['id', 'nome', 'cnpj']
  
  fornecedores.each do |fornecedor|
    t << [
      fornecedor.id,
      fornecedor.nome,
      fornecedor.cnpj
    ]
  end
end

# Exibe a tabela de fornecedores no console
puts table
