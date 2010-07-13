class Item < ActiveRecord::Base
#É criada uma classe com o nome da tabela à qual Item pertence
# A coluna de reakcuibanebto é produto_id
  belongs_to :produto, :class_name => "Produto", :foreign_key => "produto_id"
  belongs_to :pedido

  def preco_total
    self.quantidade*self.produto.preco
  end

end