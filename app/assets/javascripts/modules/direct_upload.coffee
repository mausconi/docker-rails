# http://edgeguides.rubyonrails.org/active_storage_overview.html#direct-upload-javascript-events

addEventListener 'direct-upload:initialize', (event) ->
  target = event.target
  detail = event.detail
  id = detail.id
  file = detail.file
  target.insertAdjacentHTML 'beforebegin', '
    <div id="direct-upload-' + id + '" class="direct-upload direct-upload--pending">
      <div id="direct-upload-progress-' + id + '" class="direct-upload__progress" style="width: 0%"></div>
      <span class="direct-upload__filename">' + file.name + '</span>
    </div>'
  return

addEventListener 'direct-upload:start', (event) ->
  id = event.detail.id
  element = document.getElementById('direct-upload-' + id)
  element.classList.remove 'direct-upload--pending'
  return

addEventListener 'direct-upload:progress', (event) ->
  _event$detail = event.detail
  id = _event$detail.id
  progress = _event$detail.progress
  progressElement = document.getElementById('direct-upload-progress-' + id)
  progressElement.style.width = progress + '%'
  return

addEventListener 'direct-upload:error', (event) ->
  event.preventDefault()
  _event$detail2 = event.detail
  id = _event$detail2.id
  error = _event$detail2.error
  element = document.getElementById('direct-upload-' + id)
  element.classList.add 'direct-upload--error'
  element.setAttribute 'title', error
  return

addEventListener 'direct-upload:end', (event) ->
  id = event.detail.id
  element = document.getElementById('direct-upload-' + id)
  element.classList.add 'direct-upload--complete'
  return
