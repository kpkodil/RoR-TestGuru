document.addEventListener('turbolinks:load', function() {
  
  
  const timer = document.querySelector('.timer')
    let counter = 0
    
  // if (timer) {
  //   createdAt = timer.dataset.testPassageCreatedAt
  //   start_time = createdAt.split(' ')[1]
  //   // startTime = new Time(start_time)
  //   start_seconds = start_time.split(':')[2]

  //   updatedAt = timer.dataset.testPassageUpdatedAt
  //   update_time = updatedAt.split(' ')[1]

  //   // spent_time

  // }

  if (timer) {
    // console.log(start_seconds)
    // // console.log(timer.dataset.testPassageCreatedAt - timer.dataset.testPassageUpdatedAt)
    // console.log(start_time)
    // console.log(update_time)
    // // console.log(startTime)
    // console.log(start_time - update_time)
    // console.log(  )
    passed_time()
  }

  function passed_time() {
    let time = timer.dataset.testTimer
    console.log(counter)
    console.log(time)
    counter++
    // time - counter
    document.getElementById('current_time').innerHTML = time - counter
    setTimeout(passed_time, 1000 )
  }
})
