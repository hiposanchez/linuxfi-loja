class UsuarioMailer < BaseMailer

  def cadastro( usuario )
    defaults
    subject "[MinhaLoja] - Olá #{usuario.nome}"
    recipients usuario.email
    #cc
    body :usuario => usuario
  end

end