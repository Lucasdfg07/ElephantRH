class FormController < ApplicationController
  require './app/views/pdf/generate_pdf'

  def index
  end

  def edit
  end

  def new
    @form = Form.new
    session[:id] = params[:id]
  end

  def create
    @form = Form.new(form_params)
    @form.patient_id = session[:id]

    if @form.save
      redirect_to patient_index_path, notice: 'Formulário Salvo com sucesso!'
    else
      redirect_to patient_index_path, alert: 'Erro ao cadastrar formulário'
    end
  end

  def export
    @patient = Patient.find(params[:patient_id])

    pdf = GeneratePdf::patient(@patient)
    send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'
  end

  private

  def form_params
    params.require(:form).permit(:personal_moment, :profissional_moment, :interests, :conclusions, :performance_diagnostic, personalities_characteristics: [],  intelectual_map: [], facilities: [], dificulties: [], psicological_concepts: [])
  end
end
