#A classe base em ActiveRecord será chamada ao executar a classe atual.
#Esta classe é pai de qualquer outra que referencie bancos de dados
#Vai criar na Tabela Produto+(s) uma linha ou retorna (todas as linhas como objetos
#produto = Produto.new
#produto.nome = x
#Produto.save
#Produto.all
#Produto.all.map { |p| p.nome}

class Produto < ActiveRecord::Base

  searchable do
    text :nome, :boost => 2.0
    text :descricao
    float :preco
  end

  validates_presence_of  :nome, :preco
  validates_numericality_of  :preco, :greater_then => 0, :allow_nil => true

  has_attached_file :imagem,
    :styles => { :medium => "300x300", :thumb => "100x100>" },
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
    :url => "/system/:class/:attachment/:id_partition/:style/:filename",
    :convert_options => { :all => '-strip' }

end