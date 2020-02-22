class PatientController < ApplicationController
  def index
    @patient_list = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id

    if @patient.save
      redirect_to patient_index_path, notice: 'Paciente Salvo com sucesso!'
    else
      redirect_to patient_index_path, alert: 'Erro ao cadastrar paciente'
    end
  end

  def edit
  end

  def update
    @patient = Patient.update(patient_params)
    redirect_to patient_index_path, notice: 'Paciente Atualizado com sucesso!'
  end

  def show
    @patient = Patient.find(params[:format])
  end

  def destroy
    @patient = Patient.find(params[:id]).destroy
    redirect_to request.referrer, notice: 'Cliente removido com sucesso!'
  end


  private

  def patient_params
    params.require(:patient).permit(:company, :marital_status, :name, :schooling, :age, :office, :avatar)
  end
end
