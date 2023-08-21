class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ロング' },
    { id: 3, name: 'ショート' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :cocktails
end
