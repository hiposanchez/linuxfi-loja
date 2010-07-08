#A classe base em ActiveRecord será chamada ao executar a classe atual.
#Esta classe é pai de qualquer outra que referencie bancos de dados
#Vai criar na Tabela Produto+(s) uma linha ou retorna (todas as linhas como objetos
#produto = Produto.new
#produto.nome = x
#Produto.save
#Produto.all
#Produto.all.map { |p| p.nome}

class Produto < ActiveRecord::Base

end