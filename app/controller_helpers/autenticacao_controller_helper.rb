module AutenticacaoControllerHelper
 

  protected

  def usuario_atual
    if @usuario_atual.nil? && !session[:usuario_id].blank?
      @usuario_atual = Usuario.find_by_id( session[:usuario_id] )
    end
    @usuario_atual
  end

  def usuario_atual=( usuario )
    session[:usuario_id] = usuario.id
    unless pedido_atual.blank?
      usuario.pedido_atual.unir( pedido_atual )
    end
    session[:pedido_id] = usuario.pedido_atual.id
    @usuario_atual = usuario
  end

  def pedido_atual
    unless @pedido_atual
      @pedido_atual = session[:pedido_id].blank? ?
        Pedido.new : Pedido.find_by_id( session[:pedido_id] )
    end
    @pedido_atual
  end

  def logado?
    self.usuario_atual
  end

  def administrador?
    self.logado? && self.usuario_atual.administrador?
  end

  def administrador_necessario
    if administrador?
      true
    else
      respond_to do |format|
        format.html do
          flash[:erro] = "Você precisa ser administrador para ver esta página."
          redirect_to produtos_path
        end
      end
    end
  end

end