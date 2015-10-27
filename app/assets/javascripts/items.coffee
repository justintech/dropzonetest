$(document).ready ->
  # disable auto discover
  Dropzone.autoDiscover = false

  dropzone = new Dropzone('#item-form',
    maxFiles: 1
    maxFilesize: 1
    paramName: 'item[image]'
    headers: "X-CSRF-Token" : $('meta[name="csrf-token"]').attr('content')
    addRemoveLinks: true
    clickable: '#image-preview'
    previewsContainer: '#image-preview'
    thumbnailWidth: 200
    thumbnailHeight: 200
    parallelUploads: 100;
    autoProcessQueue: false
    uploadMultiple: false)

  $('#item-submit').click (e) ->
    e.preventDefault()
    e.stopPropagation()
    if dropzone.getQueuedFiles().length > 0
      dropzone.processQueue()
    else
      $('#item-form').submit()
    return
  return

  # dropzone.on 'success', (file, responseText) ->
  #   window.location.href = '/items/' + responseText.id
  #   return