class StepEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_step_entry, only: [:show, :edit, :update, :destroy]
  
  # GET /step_entries
  def index
    @step_entries = current_user.step_entries.order(date: :desc)
  end
  
  # GET /step_entries/:id
  def show
  end
  
  # GET /step_entries/new
  def new
    @step_entry = current_user.step_entries.new(date: Date.current)
  end
  
  # POST /step_entries
  def create
    @step_entry = current_user.step_entries.new(step_entry_params)
    
    if @step_entry.save
      redirect_to step_entries_path, notice: 'Votre suivi de pas a été ajouté avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  # GET /step_entries/:id/edit
  def edit
  end
  
  # PATCH/PUT /step_entries/:id
  def update
    if @step_entry.update(step_entry_params)
      redirect_to step_entries_path, notice: 'Votre suivi de pas a été mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  # DELETE /step_entries/:id
  def destroy
    @step_entry.destroy
    redirect_to step_entries_path, notice: 'L\'entrée a été supprimée avec succès.'
  end
  
  private
  
  def step_entry_params
    params.require(:step_entry).permit(:steps, :date)
  end
  
  def set_step_entry
    @step_entry = current_user.step_entries.find(params[:id])
  end
end