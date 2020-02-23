class FormController < ApplicationController
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

  private

  def form_params
    params.require(:form).permit(:personal_moment, :profissional_moment, :interests, :conclusions, :performance_diagnostic, intelectual_map: [], facilities: [], dificulties: [], psicological_concepts: [])
  end
end
