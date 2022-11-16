require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    context '#create' do
        it 'successful login' do
            allow(User).to receive(:create)
            User.create!({:username => 'test',:password =>'test'})
            get :create, {:username=>"test", :password=>"test"}
            expect(response).to redirect_to regexes_path
        end
        it 'cannot login with wrong password' do
            allow(User).to receive(:create)
            User.create!({:username => 'test',:password =>'test'})
            get :create, {:username=>"test", :password=>"test1"}
            expect(response).to redirect_to login_path
        end
        it 'cannot login with username that does not exist' do
            allow(User).to receive(:create)
            User.create!({:username => 'test',:password =>'test'})
            get :create, {:username=>"test1", :password=>"test1"}
            expect(response).to redirect_to login_path
        end
    end
    context '#destroy' do
        it 'log out successfull' do
            get :destroy
            expect(response).to redirect_to regexes_path
        end
    end

    
end
