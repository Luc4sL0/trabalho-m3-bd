puts "Limpando banco de dados..."

DiaAtracao.delete_all
Dia.delete_all
Atracao.delete_all
Localidade.delete_all
Pais.delete_all
ClienteRoteiro.delete_all
Roteiro.delete_all
Cliente.delete_all
FormaPagamento.delete_all
DadoBancario.delete_all


puts "Criando Dados Bancários..."

db1 = DadoBancario.create!(
  banco: "Banco do Brasil",
  numero_conta: "12345-1",
  agencia: "0001"
)

db2 = DadoBancario.create!(
  banco: "Itaú",
  numero_conta: "99887-4",
  agencia: "2345"
)

db3 = DadoBancario.create!(
  banco: "Caixa Econômica",
  numero_conta: "45678-9",
  agencia: "0033"
)


puts "Criando Formas de Pagamento..."

fp1 = FormaPagamento.create!(tipo: "Cartão")
fp2 = FormaPagamento.create!(tipo: "Pix")
fp3 = FormaPagamento.create!(tipo: "Dinheiro")


puts "Criando Clientes..."

cliente1 = Cliente.create!(
  nome: "João Silva",
  email: "joao.silva@example.com",
  telefone: "31999990000",
  documento: "12345678900",
  dado_bancario_id: db1.id
)

cliente2 = Cliente.create!(
  nome: "Maria Oliveira",
  email: "maria.oliveira@example.com",
  telefone: "11988887777",
  documento: "98765432100",
  dado_bancario_id: db2.id
)

cliente3 = Cliente.create!(
  nome: "Carlos Pereira",
  email: "carlos.pereira@example.com",
  telefone: "41912345678",
  documento: "45678912300",
  dado_bancario_id: db3.id
)


puts "Criando Países..."

pais1 = Pais.create!(nome: "Brasil")
pais2 = Pais.create!(nome: "Estados Unidos")
pais3 = Pais.create!(nome: "Itália")


puts "Criando Localidades..."

loc1 = Localidade.create!(endereco: "Centro Histórico de Ouro Preto", pais_id: pais1.id)
loc2 = Localidade.create!(endereco: "Copacabana - Rio de Janeiro", pais_id: pais1.id)
loc3 = Localidade.create!(endereco: "Times Square - New York", pais_id: pais2.id)
loc4 = Localidade.create!(endereco: "Coliseu de Roma", pais_id: pais3.id)


puts "Criando Atrações..."

atr1 = Atracao.create!(nome: "Museu da Inconfidência", descricao: "Museu histórico em Ouro Preto.", localidade_id: loc1.id)
atr2 = Atracao.create!(nome: "Praia de Copacabana", descricao: "Uma das praias mais famosas do mundo.", localidade_id: loc2.id)
atr3 = Atracao.create!(nome: "Broadway", descricao: "Área famosa por teatros.", localidade_id: loc3.id)
atr4 = Atracao.create!(nome: "Coliseu", descricao: "Ponto turístico mais famoso de Roma.", localidade_id: loc4.id)
atr5 = Atracao.create!(nome: "Cristo Redentor", descricao: "Símbolo do Brasil.", localidade_id: loc2.id)


puts "Criando Roteiros..."

rot1 = Roteiro.create!(
  nome: "Roteiro Histórico Ouro Preto",
  descricao: "Tour completo pelos principais museus.",
  preco: 299.99,
  forma_pagamento_id: fp1.id
)

rot2 = Roteiro.create!(
  nome: "Roteiro Rio de Janeiro",
  descricao: "Belezas naturais e pontos turísticos.",
  preco: 999.50,
  forma_pagamento_id: fp2.id
)

rot3 = Roteiro.create!(
  nome: "Roteiro Europa Clássica",
  descricao: "Tour pela Itália e cidades históricas.",
  preco: 4999.00,
  forma_pagamento_id: fp3.id
)


puts "Criando Dias dos Roteiros..."

dia1 = Dia.create!(numero_dia: 1, descricao: "Visita a museus de Ouro Preto", roteiro_id: rot1.id)
dia2 = Dia.create!(numero_dia: 2, descricao: "Praias e Cristo Redentor", roteiro_id: rot2.id)
dia3 = Dia.create!(numero_dia: 3, descricao: "Explorando Roma", roteiro_id: rot3.id)


puts "Relacionando Atrações aos Dias..."

DiaAtracao.create!(dia_id: dia1.id, atracao_id: atr1.id)
DiaAtracao.create!(dia_id: dia2.id, atracao_id: atr2.id)
DiaAtracao.create!(dia_id: dia2.id, atracao_id: atr5.id)
DiaAtracao.create!(dia_id: dia3.id, atracao_id: atr4.id)


puts "Criando Compras..."

ClienteRoteiro.create!(data_compra: DateTime.now - 3.days, cliente_id: cliente1.id, roteiro_id: rot1.id)
ClienteRoteiro.create!(data_compra: DateTime.now - 1.day, cliente_id: cliente2.id, roteiro_id: rot2.id)
ClienteRoteiro.create!(data_compra: DateTime.now - 10.days, cliente_id: cliente3.id, roteiro_id: rot3.id)

puts "SEED FINALIZADO COM SUCESSO!"
