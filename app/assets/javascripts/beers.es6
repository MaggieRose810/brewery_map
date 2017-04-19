const brewerySelected = (brewery) => {
  loadBeers($.param({brewery_ext_id: brewery.ext_id})).then((response)=>{
    render(brewery, response.data)
  })

}

const render = (brewery, beers) => {
  let beersHtml = beers.map((beer) => {
    return `<h4>${beer.name}</h4>
    <span>${beer.description || ''}</span>
    <dt>ABV</dt>
    <dd>${beer.abv || ''}</dd>
    <dt>IBU</dt>
    <dd>${beer.ibu || ''}</dd>
    <dt>Style</dt>
    <dd>${beer.style && beer.style.category.name || ''}</dd>
    <hr>`
  }).join('')
  $('#beers').html(`
    <h3>Beers on Tap @ ${brewery.name}</h3>
    <div>${beersHtml}</div>
  `)
}