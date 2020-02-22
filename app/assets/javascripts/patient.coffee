$(document).on 'turbolinks:load', ->
  $('.patient-form').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'POST'
        dataType: 'json',
        data: $(".patient-form").serialize()
    return false

  cont = 0;
  $('.add-aspects').on 'click', ->
    cont += 1;
    $('.facilities tbody').append(
      '<tr id="' + cont + '">'+
        '<td><input id="facilities[' + cont + ']" type="text" class="facilities-input" /></td>'+
        '<td><input id="dificulties[' + cont + ']" type="text" class="dificulties-input" /></td>'+
        '<td><button class="remove-aspects" onclick="remove(' + cont + ')"><i class="fa fa-times"></i></button></td>'
      '</tr>')

  $('.'+cont).on 'click', ->
    $('.facilities tbody').hide('tr #'+count);

@remove = (id) ->
  $('#'+id).hide();
