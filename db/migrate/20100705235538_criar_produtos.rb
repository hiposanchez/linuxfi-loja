class CriarProdutos < ActiveRecord::Migration
  def self.up

    create_table :produtos do |t|
      t.string :nome, :null => false, :limit => 100
      t.text :descricao #, :default => 'José'
      t.decimal :preco, :precision => 10, :scale => 2, :null => false
      #created_at e updated_at
      t.timestamps
    end
  end
#Rails já cria uma chave primaria padrão. Não permite chave composta
  #add_index :produtos, [:nome,:preco], :unique => true

  def self.down
    drop_table :produtos
  end
end
