class Pedido < ActiveRecord::Base
#confi/initializers/inflections.rb
#É o carrinho de compras
  has_many :itens

  def adicionar_produto( produto, quantidade)
    
    if item = itens.detect { |i| i.produto == produto}
      #Já executa Produto.save
      item.update_attributes(:quantidade => quantidade + item.quantidade)
    else
      self.itens.build( :produto_id => produto.id, :quantidade => quantidade )
    end

  end
end