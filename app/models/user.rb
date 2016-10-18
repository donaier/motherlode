class User < ApplicationRecord
  devise :database_authenticatable, :trackable, :registerable

  GREETINGS = ['marhaba', 'heyello', 'grüss gott', 'namaskar', 'hola', 'ni hau', 'ahoj', 'hej', 'goedendag', 'saluton', 'salut', 'hallo', 'aloha', 'shalom', 'namaste', 'ciào', 'salve', 'moin moin', 'jambo', 'grüezi']
end
