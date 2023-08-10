class Base < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ジン' },
    { id: 3, name: 'ウォッカ' },
    { id: 4, name: 'ラム' },
    { id: 5, name: 'テキーラ' },
    { id: 6, name: 'ワイン' },
    { id: 7, name: 'ビール' },
    { id: 8, name: 'リキュール' },
    { id: 9, name: '日本酒' },
    { id: 10, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :cocktails
 
end