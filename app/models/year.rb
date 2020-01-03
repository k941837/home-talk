class Year < ActiveHash::Base
  self.data = [
    {id: 1, name: '2019年'}, 
    {id: 2, name: '2020年'}, 
    {id: 3, name: '2021年'}
  ]
end