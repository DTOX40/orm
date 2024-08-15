require_relative '../lib/json_orm.rb'

class Produto
  include JsonOrm

  arquivo_json("json/produtos.json")
end
