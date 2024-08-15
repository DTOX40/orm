require 'json'
require 'byebug'

module JsonOrm
  def self.include(base)
    base.extend(EstruturaDados)
  end

  module EstruturaDados
    def arquivo_json(path_arquivo)
      @path_arquivo = path_arquivo
      define_atributos
    end

    private

    def define_atributos
      if File.exist?(@path_arquivo)
        begin
          # Lê o conteúdo do arquivo JSON
          arquivo_json = File.read(@path_arquivo)
          # Analisa o conteúdo JSON e carrega os dados em um hash
          dados = JSON.parse(arquivo_json)
          # Exibe os dados
          debugger
          puts dados.first.keys.inspect

        rescue JSON::ParserError
          puts "Erro ao analisar o JSON! O arquivo pode estar corrompido."
        end
      else
        puts "Arquivo não encontrado!"
      end
    end
  end
end
