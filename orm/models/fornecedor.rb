require_relative '../lib/json_orm.rb'

class Fornecedor
  include JsonOrm

  arquivo_json("json/fornecedores.json")
end
