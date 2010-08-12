# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
Produto.create( [
  { :nome => "Head First Serlvets", :descricao => "Aprenda serlvets", :preco => 23},
  { :nome => "Ruby Bible", :descricao => "A salvação em Ruby", :preco => 40},
  { :nome => "Scala In Action", :descricao => "Programando", :preco => 35}
] )

Usuario.create(
  { :nome => "sanchez",
    :email => "hiposanchez@gmail.com",
    :senha => "123456",
    :senha_confirmation => "123456",
    :termos_e_condicoes => '1'
  } )

administrador = Usuario.new(
  { :nome => "sanchez",
    :email => "nidiascs@hotmail.com",
    :senha => "123456",
    :senha_confirmation => "123456",    
    :termos_e_condicoes => '1'
  } )

administrador.administrador = true
administrador.save!