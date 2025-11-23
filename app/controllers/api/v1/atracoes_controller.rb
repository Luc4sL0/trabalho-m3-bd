class Api::V1::AtracoesController < ApplicationController
  before_action :set_atracao, only: [:show, :update, :destroy]


  # SQL equivalente:
  #
  # SELECT "atracoes".*, "localidades".*
  # FROM "atracoes"
  # LEFT JOIN "localidades" ON "localidades"."id" = "atracoes"."localidade_id";
  #
  def index
    @atracoes = Atracao.all
    render json: @atracoes.to_json(include: :localidade)
  end

  
  # SQL equivalente:
  #
  # SELECT "atracoes".*, "localidades".*
  # FROM "atracoes"
  # LEFT JOIN "localidades" ON "localidades"."id" = "atracoes"."localidade_id"
  # WHERE "atracoes"."id" = ?;
  #
  def show
    render json: @atracao.to_json(include: :localidade)
  end


  # SQL equivalente:
  #
  # INSERT INTO "atracoes"
  #   (nome, descricao, localidade_id, created_at, updated_at)
  # VALUES
  #   (?, ?, ?, NOW(), NOW());
  #
  def create
    @atracao = Atracao.new(atracao_params)

    if @atracao.save
      render json: @atracao.to_json(include: :localidade), status: :created
    else
      render json: { errors: @atracao.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # SQL equivalente:
  #
  # UPDATE "atracoes"
  # SET
  #   nome = ?,
  #   descricao = ?,
  #   localidade_id = ?,
  #   updated_at = NOW()
  # WHERE
  #   id = ?;
  #
  def update
    if @atracao.update(atracao_params)
      render json: @atracao.to_json(include: :localidade)
    else
      render json: { errors: @atracao.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # SQL equivalente:
  #
  # DELETE FROM "atracoes"
  # WHERE id = ?;
  #
  # *OBS:* Caso existam dependências em outras tabelas (ex: dia_atracoes),
  # o PostgreSQL só permitirá o delete se não violar integridade referencial.
  #
  def destroy
    @atracao.destroy
    head :no_content
  end

  private


  # SQL equivalente:
  #
  # SELECT "atracoes".*
  # FROM "atracoes"
  # WHERE "atracoes"."id" = ?;
  #
  # *Levanta ActiveRecord::RecordNotFound se não existir.*
  def set_atracao
    @atracao = Atracao.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Atração não encontrada." }, status: :not_found
  end


  # Nenhum SQL aqui, apenas parâmetros permitidos
  def atracao_params
    params.require(:atracao).permit(:nome, :descricao, :localidade_id)
  end
end
