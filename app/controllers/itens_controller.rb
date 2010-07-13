class ItensController < ApplicationController

  def create
    @produto = Produto.find( params[:produto_id] )
    pedido_atual.adicionar_produto(@produto, params[:quantidade].to_i )
    pedido_atual.save
    session[:pedido_id] = pedido_atual.id
    respond_to do |format|
      format.html do
        flash[:aviso] = "Produto #{@produto.nome} adicionado com sucesso no carrinho."
        #redireciona para produtos com post antes, url sem o host
        redirect_to produtos_path
      end
    end
  end
end