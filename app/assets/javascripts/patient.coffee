$(document).on 'turbolinks:load', ->

  cont = 0;
  $('.add-aspects').on 'click', ->
    cont += 1;
    $('.facilities tbody').append(
      '<tr id="' + cont + '">'+
        '<td><input multiple="multiple" type="text" value="" name="form[facilities][]" id="form_facilities"></td>'+
        '<td><input multiple="multiple" type="text" value="" name="form[dificulties][]" id="form_dificulties"></td>'+
        '<td><div class="remove-aspects" onclick="remove(' + cont + ')"><i class="fa fa-times"></i></div></td>'
      '</tr>')

@remove = (id) ->
  $('#'+id).remove();
