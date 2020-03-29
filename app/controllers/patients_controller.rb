class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :destroy, :graph, :validation]

  def index
    if params[:search].present?
      @patients = current_user.patients.order(name: :ASC).
        where("lower(name) LIKE :search OR lower(company) LIKE :search
        OR lower(marital_status) LIKE :search OR lower(schooling) LIKE :search
        OR lower(office) LIKE :search", search: "%#{params[:search].downcase}%").paginate(page: params[:page], per_page: 10)
    else
      @patients = current_user.patients.order(name: :ASC).paginate(page: params[:page], per_page: 10)
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id

    if @patient.save
      redirect_to patients_path, notice: 'Candidato Salvo com sucesso!'
    else
      redirect_to patients_path, alert: 'Erro ao cadastrar Candidato'
    end
  end

  def graph
    @patient_graph = @patient.form.psicological_concepts

    @patient_concept_sum = @patient.form.psicological_concepts.sum
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Candidato Atualizado com sucesso!'
    else
      redirect_to patients_path, alert: 'Erro na atualização do Candidato!'
    end
  end

  def validation
  end

  def validate 
    @patient = Patient.find(params[:id_patient])

    if @patient.validate_code(params[:patient][:code].to_i)
      redirect_to office_visits_path(id_patient: @patient), notice: 'Autenticação realizada!'
    else
      redirect_to request.referrer, alert: 'Senha Inválida!'
    end
  end


  def destroy
    if @patient.destroy
      redirect_to patients_path, notice: 'Cliente removido com sucesso!'
    else
      redirect_to patients_path, alert: 'Erro na remoção do cliente!'
    end
  end


  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:company, :marital_status, :name, :schooling, :age, :office, :code, :avatar)
  end
end
