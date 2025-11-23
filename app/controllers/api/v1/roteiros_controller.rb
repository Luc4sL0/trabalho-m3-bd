class Api::V1::RoteirosController < ApplicationController
  before_action :set_roteiro, only: [:show, :update, :destroy]


  # SQL equivalente:
  #
  # SELECT "roteiros".*, "forma_pagamentos".*
  # FROM "roteiros"
  # LEFT JOIN "forma_pagamentos"
  #   ON "forma_pagamentos"."id" = "roteiros"."forma_pagamento_id";
  #
  def index
    @roteiros = Roteiro.all
    render json: @roteiros.to_json(include: :forma_pagamento)
  end


  # SQL equivalente:
  #
  # SELECT "roteiros".*, "forma_pagamentos".*
  # FROM "roteiros"
  # LEFT JOIN "forma_pagamentos"
  #   ON "forma_pagamentos"."id" = "roteiros"."forma_pagamento_id"
  # WHERE "roteiros"."id" = ?;
  #
  def show
    render json: @roteiro.to_json(include: :forma_pagamento)
  end


  # SQL equivalente:
  #
  # INSERT INTO "roteiros"
  #   (nome, descricao, preco, forma_pagamento_id, created_at, updated_at)
  # VALUES
  #   (?, ?, ?, ?, NOW(), NOW());
  #
  def create
    @roteiro = Roteiro.new(roteiro_params)

    if @roteiro.save
      render json: @roteiro.to_json(include: :forma_pagamento), status: :created
    else
      render json: { errors: @roteiro.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # SQL equivalente:
  #
  # UPDATE "roteiros"
  # SET
  #   nome = ?,
  #   descricao = ?,
  #   preco = ?,
  #   forma_pagamento_id = ?,
  #   updated_at = NOW()
  # WHERE id = ?;
  #
  def update
    if @roteiro.update(roteiro_params)
      render json: @roteiro.to_json(include: :forma_pagamento)
    else
      render json: { errors: @roteiro.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # SQL equivalente:
  #
  # DELETE FROM "roteiros"
  # WHERE id = ?;
  #
  # *OBS:* Se existirem registros dependentes em `cliente_roteiros`,
  # o PostgreSQL impedirá a exclusão a menos que haja ON DELETE CASCADE,
  # o que não está configurado no schema.
  #
  def destroy
    @roteiro.destroy
    head :no_content
  end

  private


  # SQL equivalente:
  #
  # SELECT "roteiros".*
  # FROM "roteiros"
  # WHERE "roteiros"."id" = ?;
  #
  # *Levanta ActiveRecord::RecordNotFound se não existir.*
  def set_roteiro
    @roteiro = Roteiro.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Roteiro não encontrado." }, status: :not_found
  end


  # Nenhum SQL aqui, apenas parâmetros permitidos
  def roteiro_params
    params.require(:roteiro).permit(:nome, :descricao, :preco, :forma_pagamento_id)
  end
end
