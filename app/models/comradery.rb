class Comradery < ApplicationRecord
  belongs_to :user
  belongs_to :comrade, class_name: 'User' #belongs to comrade, but the class name it's User
end
