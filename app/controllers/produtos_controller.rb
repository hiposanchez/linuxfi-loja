#Biblioteca para todos os controles. Plural. Lógica que serve para todos os controles:
#Ex, se o usuario esta logado
#rake routes GET indica...
#O nome do controler é o nome padrão da pasta e do arquivo criado (no formato especificado abaixo)
#Produtos.all exibe todos os produtos da tabela produtos.
class ProdutosController < ApplicationController

  def show
    @produto = Produto.find( params[:id] )
  end

  def index
    @titulo = 'Listagem de Produtos'
    #Array dos produtos trazidos da DB
    #@produtos = Produto.all
    @produtos = if params[:q].blank?
      Produto.all
    else
=begin
      Produto.all( :conditions => [ "nome LIKE ? OR descricao LIKE ?", params[:q], "%#{params[:q]}%" ],
        :order => "preco DESC" )
      #:select => "id, nome"
=end
      resultado = Produto.solr_search do |s|
        s.keywords params[:q]
      end
        resultado.results
      end

    #Para determinar o formato do arquivo view criado
    respond_to do |format|
      format.html
      #Para que o arquivo tenha o nome index ao invés de produtos.[html]
      #render :index
      format.xml do
        render :xml => @produtos
      end
    end

  end
end