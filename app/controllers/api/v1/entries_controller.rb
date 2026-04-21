class Api::V1::EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [ :show, :update, :destroy ]

  def index
    @entries = current_user.entries.order(created_at: :desc)
    render json: @entries, status: :ok
  end

  def show
    render json: @entry, status: :ok
  end

  def create
    @entry = current_user.entries.new(entry_params)

    if @entry.save
      render json: { message: "Entry successfully created" }, status: :ok
    else
      render json: { errors: @entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      render json: { message: "Entry successfully updated." }, status: :ok
    else
      render json: { errors: @entry.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
    render json: { message: "Entry successfully deleted" }, status: :ok
  end

  private

  def entry_params
    params.permit(:blockers, :date, :learnings, :mood, :work_done, :title)
  end

  def set_entry
    @entry = current_user.entries.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: "Entry not found." }, status: :not_found
  end
end
