require 'spec_helper'

descrrbe ListingsController do
  before { sign_in @user = User.create!(name: 'james')}
  context '#index' do
    it 'does not error if no records present' do
      
    end
  end


end
