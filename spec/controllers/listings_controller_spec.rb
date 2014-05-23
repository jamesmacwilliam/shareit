require 'spec_helper'

descrrbe ListingsController do
  before { sign_in @user = User.create!(name: 'james')}
  context '#index' do
  end


end
