class FormsController < ApplicationController
  before_action :set_patient, only: [:create, :export]
  before_action :set_form, only: [:edit, :update]

  require './app/pdf/generate_pdf'

  def index
  end

  def edit
    @count = 0
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    @form.patient_id = @patient.id

    if @form.save
      redirect_to patients_path, notice: 'Formulário Salvo com sucesso!'
    else
      redirect_to patients_path, alert: 'Erro ao cadastrar formulário'
    end
  end

  def update
    if @form.update(form_params)
      redirect_to patients_path, notice: 'Formulário Atualizado com sucesso!'
    else
      redirect_to patients_path, alert: 'Erro na atualização do Formulário!'
    end
  end

  def export
    pdf = GeneratePdf::patient(@patient)
    send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'
  end

  private

  def set_form
    @form = Form.find(params[:id])
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def form_params
    params.require(:form).permit(:personal_moment, :profissional_moment, :interests, :conclusions, :performance_diagnostic, personalities_characteristics: [],  intelectual_map: [], facilities: [], dificulties: [], psicological_concepts: [])
  end
end
