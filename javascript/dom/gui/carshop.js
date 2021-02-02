const cars = [
  { make: 'Honda', image: 'images/honda-accord-2005.jpg', model: 'Accord', year: 2005, price: 7000 },
  { make: 'Honda', image: 'images/honda-accord-2008.jpg', model: 'Accord', year: 2008, price: 11000 },
  { make: 'Toyota', image: 'images/toyota-camry-2009.jpg', model: 'Camry', year: 2009, price: 12500 },
  { make: 'Toyota', image: 'images/toyota-corrolla-2016.jpg', model: 'Corolla', year: 2016, price: 15000 },
  { make: 'Suzuki', image: 'images/suzuki-swift-2014.jpg', model: 'Swift', year: 2014, price: 9000 },
  { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 25000 },
  { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 26000 },
];

$(() => {
  let carLister = Handlebars.compile($('#car_listings').html());
  let optionBuilder = Handlebars.compile($('#options').html());
  let $cars = $('#cars');
  $cars.html(carLister({cars}));

  function unique(array) {
    let result = [];
    array.forEach(element => {
      if (!result.includes(element)) {
        result.push(element);
      }
    });

    return result;
  }

  let carMakes = unique(cars.map(({make}) => make));
  let carModels = unique(cars.map(({model}) => model));
  let carYears = unique(cars.map(({year}) => year));
  let carPrices = unique(cars.map(({price}) => price));
  $('#make').html(optionBuilder({base:"All", values: carMakes}));
  $('#model').html(optionBuilder({base:"All", values: carModels}));
  $('#year').html(optionBuilder({base:"Any", values: carYears}));
  $('#price').html(optionBuilder({base:"Any", values: carPrices}));

  function filterDownCars() {
    let result = cars.slice();
    let filters = {
      make: $('#make').children('option:selected').val(),
      model: $('#model').children('option:selected').val(),
      year: $('#year').children('option:selected').val(),
      price: $('#price').children('option:selected').val(),
    };
    console.log(filters);
    for (option in filters) {
      if (filters[option]) {
        result = result.filter(car => String(car[option]) === filters[option]);
      }
    }
    return result;
  }

  $('#filters button').on('click', function(e) {
    $cars.html(carLister(({cars: filterDownCars()})));
  });

  $('#make').on('change', function(e) {
    $('#model').html(optionBuilder({
      base: 'All', 
      values: unique(cars.filter(({make, model}) => {
        return make === $('#make').children('option:selected').val(); 
      }).map(({model}) => model)),
    }));
  });
});