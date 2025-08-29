class ToDosController < ApplicationController
  before_action :set_to_do, only: %i[ show edit update destroy ]

  def index
    render json: ToDo.all
  end

  def show
    render json: @to_do
  end

  def new
    @to_do = ToDo.new
  end

  def edit
  end

  def create
    @to_do = ToDo.new(to_do_params)
    if @to_do.save
      render json: @to_do
    else
      render json: { errors: @to_do.errors, status: :unprocessable_entity }
    end
  end

  def update
    if to_do_params[:date_completed].blank?
      to_do_params[:date_completed] = nil
    else
      to_do_params[:date_completed] = DateTime.iso8601(to_do_params[:date_completed])
    end
    if @to_do.update(to_do_params)
      render json: { status: :ok, to_do: @to_do }
    else
      render json: { errors: @to_do.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    @to_do.destroy!
    render json: { status: :ok }
  end

  private
  
  def set_to_do
    @to_do = ToDo.find(params.expect(:id))
  end

  
  def to_do_params
    params.expect(to_do: [ :title, :due_on, :notify_id, :notes, :added_by_id, :assigned_to_id, :date_completed ])
  end
end
