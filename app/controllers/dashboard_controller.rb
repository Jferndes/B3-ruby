class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # Récupérer les données de poids triées par date (descendant)
    @weight_entries = current_user.weight_entries.order(date: :desc).limit(30)
    
    # Récupérer les données de pas triées par date (descendant)
    @step_entries = current_user.step_entries.order(date: :desc).limit(30)
    
    # Calcul des statistiques pour le poids
    if @weight_entries.count >= 2
      @latest_weight = @weight_entries.first
      @previous_weight = @weight_entries.second
      @first_weight = @weight_entries.last
      @weight_diff = @latest_weight.weight - @previous_weight.weight
      @total_weight_diff = @latest_weight.weight - @first_weight.weight
    end
    
    # Calcul des statistiques pour les pas
    if @step_entries.count >= 1
      @latest_steps = @step_entries.first
      @total_steps = @step_entries.sum(&:steps)
      @avg_steps = @step_entries.average(:steps).to_i
    end
  end
end