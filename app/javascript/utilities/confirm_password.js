document.addEventListener('turbolinks:load', function() {

  const control = document.querySelector('.password-confirmation-field')

  if (control) {
    const confirmation_field = document.getElementById('user_password_confirmation')
    const password_field = document.getElementById('user_password')
    const check_icon = document.querySelector('.octicon-check-circle')
    const alert_icon = document.querySelector('.octicon-alert')

    control.addEventListener('keyup', function() {
      confirmPassword(confirmation_field, password_field, check_icon, alert_icon)
    })
  }
})

function confirmPassword(confirmation_field, password_field, check_icon, alert_icon) {

  if (confirmation_field.value == password_field.value) {
    alert_icon.classList.add('hide') 
    check_icon.classList.remove('hide') 
    console.log("true")
  } else {
    alert_icon.classList.remove('hide')
    check_icon.classList.add('hide') 
    console.log("false")
  }

  if (confirmation_field.value == "") {
    alert_icon.classList.add('hide') 
    check_icon.classList.add('hide') 
  }
} 
    