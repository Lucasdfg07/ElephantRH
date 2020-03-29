class OfficeVisitsController < ApplicationController
  before_action :set_office_visit, only: [:show, :edit, :update, :destroy]
  before_action :set_patient, only: [:index, :edit, :new, :create]


  def index
    @office_visits = OfficeVisit.all
  end


  def show
  end


  def new
    @office_visit = OfficeVisit.new
  end

  def edit
  end


  def create
    @office_visit = OfficeVisit.new(office_visit_params)
    @office_visit.patient = @patient

    if @office_visit.save
      redirect_to office_visits_path(id_patient: params[:id_patient]), notice: 'Consulta criada com sucesso!'
    else
      redirect_to office_visits_path(id_patient: params[:id_patient]), notice: 'Erro na criação da consulta.'
    end
  end


  def update
    if @office_visit.update(office_visit_params)
      redirect_to office_visits_path(id_patient: params[:id_patient]), notice: 'Consulta atualizada com sucesso.'
    else
      redirect_to office_visits_path(id_patient: params[:id_patient]), notice: 'Erro na atualização da consulta.'
    end
  end


  def destroy
    @office_visit.destroy
    redirect_to request.referrer, notice: 'Consulta cancelada com sucesso!'
  end

  private

    def set_patient
      @patient = Patient.find(params[:id_patient])
    end

    def set_office_visit
      @office_visit = OfficeVisit.find(params[:id])
    end


    def office_visit_params
      params.require(:office_visit).permit(:patient_id, :description, {documents: []})
    end
end
