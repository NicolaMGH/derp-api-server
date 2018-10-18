class HomeController < ApplicationController
  def test
    @user = User.create!(name: 'test', email: 'test@test.com', password_digest: '12345')
    render json: @user
  end
end
