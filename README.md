# **Trabalho M3 – Banco de Dados**

## CRUD funcional com Ruby on Rails + PostgreSQL

**Domínio: Plataforma de Turismo**

Este repositório contém uma API REST construída em **Ruby on Rails**, implementando **CRUD funcional para 3 tabelas centrais e relacionadas** do domínio de turismo:

* **Clientes**
* **Roteiros**
* **Atrações**

O projeto atende integralmente aos requisitos acadêmicos:

* CRUD completo (Create, Read, Update, Delete)
* Persistência em banco relacional PostgreSQL
* Entidades centrais e relacionadas
* SQL equivalente documentado no código
* Estruturação de chaves primárias e estrangeiras
* Inserção de dados exemplo
* Entregável funcional e validado

---

# **1. Como rodar o projeto**

### Requisitos:

* **Ruby** (versão 3.x ou superior)
* **Rails** (7.x)
* **PostgreSQL**
* **Git**

---

# **2. Instalando Ruby e Rails (caso nunca tenha usado)**

### **No Windows (via WSL recomendado):**

1. Ativar WSL2 + Ubuntu
2. Instalar Ruby:

   ```bash
   sudo apt update
   sudo apt install ruby-full build-essential
   ```
3. Instalar Rails:

   ```bash
   gem install rails
   ```

### **No Linux (Ubuntu / Debian):**

```bash
sudo apt update
sudo apt install ruby-full postgresql postgresql-contrib build-essential
gem install rails
```

### **No macOS:**

```bash
brew install ruby
gem install rails
brew install postgresql
```

---

# **4. Configurando credenciais no `config/database.yml`**

Abra o arquivo:

```
config/database.yml
```

Edite a seção `development`:

```yml
development:
  username: meu_usuario
  password: minha_senha
```

---

# 🚀 **5. Instalando dependências e criando o banco**

Execute:

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed # Popula a tabela com dados
```

---

# ▶️ **6. Rodando o servidor**

```bash
rails server
```

A API fica disponível em:

```
http://localhost:3000
```

---

# **7. Rotas da API (todas as rotas CRUD)**

Aqui estão documentadas todas as rotas implementadas para avaliação.

---

# **Clientes**

### **GET /api/v1/clientes/:id**

Retorna um cliente + dados bancários.

### **POST /api/v1/clientes**

Body:

```json
{
  "cliente": {
    "nome": "João",
    "email": "joao@email.com",
    "telefone": "99999-9999",
    "documento": "12345678900",
    "dado_bancario_attributes": {
      "banco": "Nubank",
      "numero_conta": "0001",
      "agencia": "123"
    }
  }
}
```

### **PUT /api/v1/clientes/:id**

Atualiza cliente + dados bancários.

### **DELETE /api/v1/clientes/:id**

Exclui cliente.

---

# **Roteiros**

### **GET /api/v1/roteiros**

Lista todos os roteiros (inclui forma_pagamento).

### **GET /api/v1/roteiros/:id**

Retorna 1 roteiro.

### **POST /api/v1/roteiros**

```json
{
  "roteiro": {
    "nome": "Tour Rio",
    "descricao": "Passeio completo",
    "preco": 200.5,
    "forma_pagamento_id": 1
  }
}
```

### **PUT /api/v1/roteiros/:id**

Atualiza 1 roteiro.

### **DELETE /api/v1/roteiros/:id**

Remove um roteiro.

---

# **Atrações**

### **GET /api/v1/atracoes**

Lista todas as atrações (inclui localidade).

### **GET /api/v1/atracoes/:id**

Retorna 1 atração.

### **POST /api/v1/atracoes**

```json
{
  "atracao": {
    "nome": "Cristo Redentor",
    "descricao": "Ponto turístico",
    "localidade_id": 1
  }
}
```

### **PUT /api/v1/atracoes/:id**

Atualiza atração.

### **DELETE /api/v1/atracoes/:id**

Remove atração.

---

# **8. Resumo das Entidades Centrais**

| Tabela       | Relacionamento             | Descrição                     |
| ------------ | -------------------------- | ----------------------------- |
| **clientes** | pertence a dado_bancario   | entidade principal de pessoas |
| **roteiros** | pertence a forma_pagamento | representa pacotes de turismo |
| **atracoes** | pertence a localidade      | pontos turísticos do roteiro  |

---

# **9. Testando a API**

Você pode testar usando:

* Postman
* Insomnia
* curl

Exemplo:

```bash
curl -X GET http://localhost:3000/api/v1/roteiros
```
