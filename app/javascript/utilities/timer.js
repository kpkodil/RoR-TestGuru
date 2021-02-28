document.addEventListener('turbolinks:load', function() {
  const timer = document.querySelector('.timer')
  if (timer) {
    passed_time()
  }

  function passed_time() {
    const createdAt = timer.dataset.testPassageCreatedAt
    const testTimerSeconds = timer.dataset.testTimer * 60
    let currentTime = parseInt(Date.now()/1000)
    spentTime = currentTime - createdAt
    result = testTimerSeconds - spentTime
    console.log(result)
    if (result < 1 ) {
      document.getElementById('next').addEventListener('click', function(){})
      document.getElementById('next').click()
    }
    document.getElementById('current_time').innerHTML = converted_seconds(result)
    setTimeout(passed_time, 1000 )
  }

  function converted_seconds(seconds){
    resultMinutes = Math.floor(seconds/60)
    resultSeconds = seconds - resultMinutes * 60
    result = resultMinutes + ":" + resultSeconds
    return result
  }

})
