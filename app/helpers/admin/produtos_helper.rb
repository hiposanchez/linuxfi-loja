#Em ruby um objeto não pode herdar de vários. Estrutura genética que pode ser inserida em qualquer
# estrutura é um module
module Admin::ProdutosHelper
#O metodo esta utilizando um bloco
  def admin_form_for_produto( &block )
    opcoes = if @produto.new_record?
      [ admin_produtos_path, :post ]
    else
      [ admin_produto_path( @produto ), :put]
    end
    form_for( @produto,
      :url => opcoes.first,
      :html => { :method => opcoes.last },
      &block
    )
  end

end