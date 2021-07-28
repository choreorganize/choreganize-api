require 'rails_helper'

RSpec.describe "User API" do
  context 'User index'
    it 'happy path: sends all users'

  context 'Users show'
    it 'happy path: can find a single user'
    it 'sad path: cannot find the user'

  context 'Users create'
    it 'happy path: can create a new user'
    it 'sad path: cannot create user without all params'  
end