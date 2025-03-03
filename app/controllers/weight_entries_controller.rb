class WeightEntriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_weight_entry, only: [:show, :edit, :update, :destroy]
  
    # GET /weight_entries
    def index
      @weight_entries = current_user.weight_entries.order(date: :desc)
    end
  
    # GET /weight_entries/:id
    def show
    end
  
    # GET /weight_entries/new
    def new
        # Remarque @variable : le @ permet d'utiliser la variable du controller vers la vue
        # .new = Constructeur de l'objet WeightEntry
      @weight_entry = current_user.weight_entries.new(date: Date.current)
    end
  
    # POST /weight_entries
    def create
      @weight_entry = current_user.weight_entries.new(weight_entry_params)
  
        if @weight_entry.save
        redirect_to weight_entries_path, notice: 'Votre suivi de poids a été ajouté avec succès.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # GET /weight_entries/:id/edit
    def edit
    end
  
    # PATCH/PUT /weight_entries/:id
    def update
      if @weight_entry.update(weight_entry_params)
        redirect_to weight_entries_path, notice: 'Votre suivi de poids a été mis à jour avec succès.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # DELETE /weight_entries/:id
    def destroy
      @weight_entry.destroy
      redirect_to weight_entries_path, notice: 'L’entrée a été supprimée avec succès.'
    end
  
    private
        def weight_entry_params
            params.require(:weight_entry).permit(:weight, :date)
        end

        def set_weight_entry
            @weight_entry = current_user.weight_entries.find(params[:id])
        end
    
end