db.city.find( {$and : [
  {$or : [
    {state : 'CA'},
    {state : 'NY'},
  ]},
  {population : {$gt : 100000} }
]})