document.addEventListener('turbolinks:load', function() {

  var control = document.querySelector('.password-confirmation-field')

  if (control) {
    control.addEventListener('keyup', confirmPassword)
  }
})

function confirmPassword() {

  var confirmation = document.getElementById('user_password_confirmation').value
  var password = document.getElementById('user_password').value

  if (confirmation == password) {
    this.querySelector('.octicon-alert').classList.add('hide') 
    this.querySelector('.octicon-check-circle').classList.remove('hide') 
  } else {
    this.querySelector('.octicon-alert').classList.remove('hide')
    this.querySelector('.octicon-check-circle').classList.add('hide') 
  }
  
  if (confirmation == "") {
    this.querySelector('.octicon-alert').classList.add('hide') 
    this.querySelector('.octicon-check-circle').classList.add('hide') 
  }
} 
    