class Expensecategory < ActiveHash::Base
  self.data = [
    {id: 1, name: '食費'}, {id: 2, name: '日用品'}, {id: 3, name: '衣服'},
    {id: 4, name: '美容'}, {id: 5, name: '交際費'}, {id: 6, name: '医療費'},
    {id: 7, name: '教育費'}, {id: 8, name: '光熱費'}, {id: 9, name: '交通費'},
    {id: 10, name: '通信費'}, {id: 11, name: '住宅費'}
  ]
end