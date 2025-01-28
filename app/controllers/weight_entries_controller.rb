class WeightEntriesController < ApplicationController
    before_action :set_weight_entry, only:[:show, :edit, :update, :destroy]

    public
        def index
            @weight_entries = WeightEntry.order(date: :desc)
        end

        def show
        end

        def new
            # Remarque @variable : le @ permet d'utiliser la variable du controller vers la vue
            # .new = Constructeur de l'objet WeightEntry
            @weight_entry = WeightEntry.new
        end

        def create
            @weight_entry = WeightEntry.new(weight_entry_params)

            if @weight_entry.save
                redirect_to weight_entries_path, notice: 'Votre suivi de poids a été ajouté avec succès'
            else
                render :new
            end
        end
        
        def edit
        end

        def update
        end

        def destroy
            @weight_entry.destroy
            redirect_to weight_entries_path
        end

    private
        def weight_entry_params
            params.require(:weight_entry).permit(:weight, :date)
        end

        def set_weight_entry
            @weight_entry = WeightEntry.find(params[:id])
        end
    
end
