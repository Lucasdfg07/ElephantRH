class PatientController < ApplicationController
  def index
    @patients = current_user.patient
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id

    if @patient.save
      redirect_to form_new_path(patient_id: @patient.id), notice: 'Candidato Salvo com sucesso!'
    else
      redirect_to patient_index_path, alert: 'Erro ao cadastrar Candidato'
    end
  end

  def graph
    @patient_individual = Patient.find(params[:patient_id])
    @patient_graph = @patient_individual.form.psicological_concepts
    @patient_concept_sum = @patient_individual.form.psicological_concepts.sum
  end

  def edit
    @patient = Patient.find(params[:patient_id])
  end

  def update
    @patient = Patient.find(params[:patient_id])

    if @patient.update(patient_params)
      redirect_to patient_index_path, notice: 'Candidato Atualizado com sucesso!'
    else
      redirect_to patient_index_path, alert: 'Erro na atualização do Candidato!'
    end
  end

  def show
  end

  def destroy
    @patient = Patient.find(params[:id])

    if @patient.destroy
      redirect_to patient_index_path, notice: 'Cliente removido com sucesso!'
    else
      redirect_to patient_index_path, alert: 'Erro na remoção do cliente!'
    end
  end


  private

  def patient_params
    params.require(:patient).permit(:company, :marital_status, :name, :schooling, :age, :office, :avatar)
  end
end
