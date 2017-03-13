class User < ApplicationRecord
  devise :database_authenticatable, :trackable, :registerable

  has_many :group_comments

  GREETINGS = ['marhaba', 'heyello', 'grüss gott', 'namaskar', 'hola', 'ni hau', 'ahoj', 'hej', 'goedendag', 'saluton', 'salut', 'hallo', 'aloha', 'shalom', 'namaste', 'ciào', 'salve', 'moin moin', 'jambo', 'grüezi']
end
