document.addEventListener('turbolinks:load', function() {

  const controls = document.querySelectorAll('.form-inline-link')
  const errors = document.querySelector('.resource-errors')

  if (controls.length > 0) {
    formInlineHandlerWithErrors(errors)
    formInlineLinkHandlerEach(controls) 
  }
})

function formInlineHandlerWithErrors(errors) {
  if (errors) {
    const resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
}

function formInlineLinkHandlerEach(controls) {
  for (var i = 0; i < controls.length; i++) {
    controls[i].addEventListener('click', formInlineLinkHandler)
  }
}

function formInlineLinkHandler(event) {
  event.preventDefault()
  const testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  const $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  const $formInline = $('.form-inline[data-test-id="' + testId + '"]')
  $formInline.toggle()
  $testTitle.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Edit'
  }
}
