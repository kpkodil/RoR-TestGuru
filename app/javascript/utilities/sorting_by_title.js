document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title')

  if (control) {
    control.addEventListener('click', sortRowsByTitle)
  }
})

function sortRowsByTitle() {
  const table = document.querySelector('table')

  const sortedRows = Array.from(table.rows).slice(1)
  
  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {

    sortedRows
      .sort((row1, row2) => row1.cells[0].innerHTML > row2.cells[0].innerHTML ? 1 : -1);
    rebuildTable(table, sortedRows)  
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')

  } else {

    sortedRows
      .sort((row1, row2) => row1.cells[0].innerHTML > row2.cells[0].innerHTML ? -1 : 1);
    rebuildTable(table, sortedRows)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }
}

function rebuildTable(table, sortedRows) {
  table.tBodies[0].append(...sortedRows)
}
