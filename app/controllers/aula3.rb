#github ssh-keygen -t rsa -C hiposanchez@gmail.com
#/home/linuxfi/.ssh/id_rsa.pub
#linuxfi@linuxfi-desktop:~/.ssh$ ssh git@github.com
#sudo apt-get install git-core
#git config --global user.name "Your Name"
#git config --global user.email hiposanchez@gmail.com
#Copiar pt-br para config/locales/pt-BR.yml
#linuxfi@linuxfi-desktop:~/NetBeansProjects/loja$ git config --global user.name "hiposanchez"
#linuxfi@linuxfi-desktop:~/NetBeansProjects/loja$ git config --global user.email "hiposanchez@gmail.com"
#linuxfi@linuxfi-desktop:~/NetBeansProjects/loja$ git init . (espaço ponto)
# gedit .gitignore
#*.log
#*.pid
#nbproject/*
#Sempre que pegar o projeto.... development.log
#Dentro de log -> development.log, sempre que baixar um repositorio rails


class Produto < ActiveRecord::Base
  #se o nome for diferente de Produtos... (Fora do padrão)
  #set_table_name 'produto'
  validates_presence_of :nome, :preco
  validates_numericaly_of :preco, :greater_than => 0, :allow_nil => true
  #as validações mais comuns (que controlam o que o usuario devera informar estao em
  #api.rubyonrails.org -< methods ActiveRecord::Validation::ClassMethods
  #produto.valid?
  #produto.save produto.create (com exclamação -verbose)
end
#Instalar Ruby via repositório irb libopenssl irb ruby...
#Retirar a linha socket para não haver incompatibilidade com mac ou outras distros
#dois espaços nada de tab.
#sudo chown -R sanchez:sanchez /usr/local/glassfish


#Modificar o nome da Database
#e colocar senha
#rake db:create
#mysql -u root -px
#show databases;
#Dentro da aplicação: script/console (abre o irb)
#script/server (abre um servidor0.0.0.0.3000)


#script/generate create:db (para crear DB
# rake db:migrate (para passar altreções em db - migrate
#rake db:migrate:redo (executa o down e o up conforme arquivo em migrate)
#rake db:migrate:down VERSION=20100705235538
#A tabela schema_migration roda registra todas as migraçẽos rodadas(versões)
#rake -T (main do rake)
#timezone de brasilia em config/environment
#sudo ln -l /usr/bin/irb1.8 /usr/bin/irb par referenciar