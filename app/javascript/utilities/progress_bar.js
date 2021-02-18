document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    progressBar.max = progressBar.dataset.testQuestionsCount
    progressBar.value = progressBar.dataset.numberOfQuestion
  }
})
