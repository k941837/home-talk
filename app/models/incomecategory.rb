class Incomecategory < ActiveHash::Base
  self.data = [
      {id: 1, name: '給料'}, {id: 2, name: 'おこづかい'}, {id: 3, name: '賞与'},
      {id: 4, name: '副業'}, {id: 5, name: '投資'}, {id: 6, name: '臨時収入'}
    ]
  end