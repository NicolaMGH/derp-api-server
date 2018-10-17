class HomeController < ApplicationController
  @user = User.new(name: 'test', email: 'test@test.com', password_digest: '12345')
  def test
    render json: @user
  end
end
