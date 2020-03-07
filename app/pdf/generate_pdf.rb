require 'prawn'
require 'gruff'

module GeneratePdf
  PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size   => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin      => [120, 75],

    :background => "#{Rails.root.to_s}/app/assets/images/timbrado.png"
  }

  def self.patient patient

    g = Gruff::Net.new
    g.title = 'Gráfico de conceito psicológico'
    g.labels = { 0 => 'Dinamismo', 1 => 'Comunicação', 2 => 'Trabalho em Equipe', 3 => 'Relacionamento', 4 => 'Organização',
                 5 => 'Adaptação', 6 => 'Trabalho sob pressão', 7 => 'Proatividade', 8 => 'Iniciativa' }

    g.legend_margin = 45

    g.marker_font_size = 16

    # Escolhe as cores que serão usadas
    if (patient.form.psicological_concepts.sum > 19)
      g.theme = {
       :colors => ['#aedaa9', '#64BFF7', '#E7F2F9'],
       :marker_color => '#dddddd',
       :font_color => 'black',
       :background_colors => 'white'
      }
    else
      g.theme = {
       :colors => ['#EC5A3B', '#64BFF7', '#E7F2F9'],
       :marker_color => '#dddddd',
       :font_color => 'black',
       :background_colors => 'white'
      }
    end

    @datasets = [
      [:Paciente, patient.form.psicological_concepts],
      [:Recomendado, [2,2,2,3,3,2,2,2,2]],
      [:Origem, [0,0,0,0,0,0,0,0,0]]
      ]

    @datasets.each do |data|
      g.data(data[0], data[1], data[2])
    end

    g.write('public/radar_graph.png')

    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      # image = "#{Rails.root.to_s}/app/assets/images/papel.jpg"
      # pdf.image image
      # Define a cor do traçado
      pdf.fill_color "666666"
      # Cria um texto com tamanho 30 PDF Points, bold alinha no centro
      pdf.text "AVALIAÇÃO PSICOLÓGICA", :size => 16, :style => :bold, :align => :center

      pdf.text "DATA: #{(Time.now).strftime("%d/%m/%y")}", :align => :right
      # Move 80 PDF points para baixo o cursor
      pdf.move_down 40

      pdf.text "IDENTIFICAÇÃO DO CANDIDATO", :size => 13, :style => :bold
      pdf.horizontal_line 0, 450

      pdf.move_down 10

      table_data = [["<b>Empresa</b>", "#{patient.company}"],["<b>Nome do candidato</b>", "#{patient.name}"],
      ["<b>Idade</b>", "#{patient.age} anos"], ["<b>Estado civil</b>", "#{patient.marital_status}"],
      ["<b>Escolaridade</b>", "#{patient.schooling}"], ["<b>Cargo</b>", "#{patient.office}"]]

      pdf.table(table_data,:header => true, :width => 450, :cell_style => { :inline_format => true, size: 9 })
      # Move mais 30 PDF points para baixo o cursor
      pdf.move_down 40

      pdf.text "DADOS DA ENTREVISTA", :size => 13, :style => :bold
      pdf.horizontal_line 0, 450

      pdf.move_down 10
      pdf.text "Momento Pessoal", :size => 10, :style => :bold
      pdf.text "#{patient.form.personal_moment}", :size => 9

      pdf.move_down 10
      pdf.text "Momento Profissional", :size => 10, :style => :bold
      pdf.text "#{patient.form.profissional_moment}", :size => 9

      pdf.move_down 10
      pdf.text "Autopercepção e interesses", :size => 10, :style => :bold
      pdf.text "#{patient.form.interests}", :size => 9

      pdf.move_down 10
      pdf.text "Conclusões da Entrevista", :size => 10, :style => :bold
      pdf.text "#{patient.form.conclusions}", :size => 9

      pdf.move_down 220

      pdf.text "ÁREA INTELECTUAL", :size => 13, :style => :bold
      pdf.horizontal_line 0, 450

      pdf.move_down 10

      table_data = [["<b>Habilidades</b>", "<b>Conceitos</b>"],["Potencial intelectual", "#{patient.form.intelectual_map[0]}"],
      ["Atenção concentrada", "#{patient.form.intelectual_map[1]}"], ["Atenção Difusa", "#{patient.form.intelectual_map[2]}"],
      ["Habilidade  numérica", "#{patient.form.intelectual_map[3]}"]]

      pdf.table(table_data,:header => true, :width => 450, :cell_style => { :inline_format => true, size: 9 })

      pdf.move_down 10
      pdf.text "<b>S</b> – Superior     <b>MS</b> – Médio Superior     <b>M</b> – Médio   <b>MI</b> – Médio Inferior    <b>I</b> – Inferior", :size => 10, :style => :bold, :align => :center, :inline_format => true

      pdf.move_down 80

      pdf.text "CARACTERÍSTICAS DA PERSONALIDADE", :size => 13, :style => :bold
      pdf.horizontal_line 0, 450

      pdf.move_down 10

      table_data = [["<b>Organização</b>", "#{patient.form.personalities_characteristics[0]}", "<b>Adaptação</b>", "#{patient.form.personalities_characteristics[1]}", "<b>Iniciativa</b>", "#{patient.form.personalities_characteristics[2]}"],
      ["<b>Relacionamento</b>", "#{patient.form.personalities_characteristics[3]}", "<b>Trabalho sob Pressão</b>", "#{patient.form.personalities_characteristics[4]}", "<b>Dinamismo</b>", "#{patient.form.personalities_characteristics[5]}"],
      ["<b>Comunicação</b>", "#{patient.form.personalities_characteristics[6]}", "<b>Proatividade</b>", "#{patient.form.personalities_characteristics[7]}", "<b>Trabalho Equipe</b>", "#{patient.form.personalities_characteristics[8]}"]]

      pdf.table(table_data,:header => true, :width => 450, :cell_style => { :inline_format => true, size: 9, align: :center })

      pdf.move_down 80

      table_data = [["<b>Competências Facilitadoras</b>", "<b>Aspectos Limitantes</b>"]]

      @cont = 0
      patient.form.facilities.each do
        table_data += [["#{patient.form.facilities[@cont]}", "#{patient.form.dificulties[@cont]}"]]
        @cont += 1
      end
      pdf.table(table_data,:header => true, :width => 450, :cell_style => { :inline_format => true, size: 9 })

      pdf.move_down 40

      pdf.image "public/radar_graph.png", :scale => 0.50

      pdf.move_down 40

      pdf.text "PROGNÓSTICO DE DESEMPENHO", :size => 13, :style => :bold
      pdf.horizontal_line 0, 450

      pdf.text "#{patient.form.performance_diagnostic}", :size => 9
      # Muda de font para Helvetica
      pdf.font "Helvetica"
      # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
      pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
      # Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
      pdf.render_file('public/patient_relatory.pdf')
    end
  end
end
