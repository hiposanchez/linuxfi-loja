class Pedido < ActiveRecord::Base
  #config/initializers/inflections.rb
  #É o carrinho de compras
  #Ao apagar o pedido, os itens tambem sao apagados
  has_many :itens, :dependent => :destroy
  #mesmo que def itens_attributes=(array)
  accepts_nested_attributes_for :itens
  before_save :remover_itens_zerados #, outros métodos
  # ou after_save { |pedido| pedido.itens.clear }

  def adicionar_produto( produto, quantidade)
    if item = itens.detect { |i| i.produto == produto}
      #Já executa item.save
      item.update_attributes(:quantidade => quantidade + item.quantidade)
    else
      self.itens.build( :produto_id => produto.id, :quantidade => quantidade )
    end
  end

  def preco_total
    #Converte o hashe em array para que o método sum não some na Data
    #Base,  mas diretamente no objeto
    self.itens.to_a.sum( &:preco_total )
    #self.itens.to_a.sum { |item| item.preco_total }
  end

  def blank?
    self.itens.blank?
  end

  def remover_itens_zerados
    itens_a_remover = []
    self.itens.each do |item|
      #puts item.spect (debugar)
      if item.quantidade.blank? || item.quantidade < 1
        itens_a_remover << item
      end
      #item.destroy if item.quantidade.blank? || item.quantidade < 1
    end
    #Remover todos(*) os itens de uma vez só, após navegar no objeto
    self.itens.delete( *itens_a_remover )
    true #Sempre escrever true após os ganchos a fim de que os próximos métodos do método before_save etc possam ser chamados
  end

end