# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
#Todos os controles herdam deste daqui.

#Este é o master
#Este ainda é o master

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  #Para que este novo helper fique visível para todos os demais controlers
  include AutenticacaoControllerHelper

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  #Qualquer parametro que pareça com senha não são gravados no log

  filter_parameter_logging /senha/

    #Métodos que ficam disponíveis para as views
  helper_method :pedido_atual, :usuario_atual, :logado?, :administrador?

  protected

  def pedido_atual
    unless @pedido_atual
      @pedido_atual = session[:pedido_id].blank? ?
        Pedido.new : Pedido.find_by_id( session[:pedido_id] )
    end
    @pedido_atual
  end

  def load_page
    @page = params[:page] || 1
    @per_page = params[:per_page] || 10
    if @per_page.to_i > 30
      @per_page = 30
    end
    @per_page = 2
  end

  def paginate( scope, options = {} )
    load_page
    scope.paginate( { :page => @page, :per_page => @per_page }.merge( options ) )
  end

end
