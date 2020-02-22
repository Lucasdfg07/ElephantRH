class FormController < ApplicationController
  def index
  end

  def edit
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    @form.user_id = current_user.id

    if @form.save
      redirect_to patient_index_path, notice: 'Formulário Salvo com sucesso!'
    else
      redirect_to patient_index_path, alert: 'Erro ao cadastrar formulário'
    end
  end
end
