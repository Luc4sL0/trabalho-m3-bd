class Api::V1::ClientesController < ::ApplicationController
  before_action :set_cliente, only: [:show, :update, :destroy]


  # SQL equivalente:
  # SELECT "clientes".*, "dado_bancarios".*
  # FROM "clientes"
  # LEFT JOIN "dado_bancarios" ON "dado_bancarios"."id" = "clientes"."dado_bancario_id"
  # WHERE "clientes"."id" = ?
  def show 
    render json: @cliente.to_json(include: :dado_bancario)
  end


  # SQL equivalente para criação:
  # 1) INSERT INTO "dado_bancarios" (banco, numero_conta, agencia, created_at, updated_at)
  #    VALUES (?, ?, ?, NOW(), NOW())
  #
  # 2) INSERT INTO "clientes" (nome, email, telefone, documento, dado_bancario_id, created_at, updated_at)
  #    VALUES (?, ?, ?, ?, ?, NOW(), NOW())
  def create 
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      render json: @cliente.to_json(include: :dado_bancario), status: :created
    else
      render json: { errors: @cliente.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # SQL equivalente para update:
  #
  # UPDATE "clientes"
  # SET nome = ?, email = ?, telefone = ?, documento = ?, updated_at = NOW()
  # WHERE id = ?;
  #
  # UPDATE "dado_bancarios"
  # SET banco = ?, numero_conta = ?, agencia = ?, updated_at = NOW()
  # WHERE id = ?;
  def update 
    if @cliente.update(cliente_params)
      render json: @cliente.to_json(include: :dado_bancario)
    else
      render json: { errors: @cliente.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # SQL equivalente:
  #
  # DELETE FROM "clientes"
  # WHERE id = ?;
  #
  # *OBS:* Como existe foreign_key, o dado_bancario NÃO é apagado automaticamente,
  # a menos que o modelo tenha dependência configurada.
  def destroy 
    @cliente.destroy
    head :no_content
  end

  private


  # SQL equivalente:
  #
  # SELECT "clientes".*
  # FROM "clientes"
  # WHERE "clientes"."id" = ?
  #
  # *Se não encontrar, ActiveRecord levanta ActiveRecord::RecordNotFound*
  def set_cliente
    @cliente = Cliente.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    return render json: { message: "Cliente não encontrado." }, status: :not_found
  end

  
  # Nenhum SQL aqui, apenas parâmetros permitidos
  def cliente_params
    params.require(:cliente).permit(
      :nome, :email, :telefone, :documento, 
      dado_bancario_attributes: [:banco, :numero_conta, :agencia]
    )
  end
end