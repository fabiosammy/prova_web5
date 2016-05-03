jQuery.fn.addPhoneMasks = ->
  $('input[id*="phone"]').each ->
    $(this).mask("999-999-9999?")

jQuery ->
  $('div#phones').addPhoneMasks()