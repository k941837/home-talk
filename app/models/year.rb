class Year < ActiveHash::Base
  self.data = [
    {id: 2019, name: '2019年'}, 
    {id: 2020, name: '2020年'}, 
    {id: 2021, name: '2021年'}
  ]
end