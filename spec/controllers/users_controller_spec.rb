require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    context '#create' do
        it 'successful create a user' do
            get :create, {:user=>{:username=>"test", :password=>"test",:password_confirmation=>"test"}}
            expect(response).to redirect_to regexes_path
        end
        it 'cannot create a user when the password is wrong' do
            get :create, {:user=>{:username=>"test", :password=>"test",:password_confirmation=>"test1"}}
            expect(response).to render_template("new")
        end
        it 'cannot duplicate username' do
            allow(User).to receive(:create)
            User.create!({:username => 'test',:password =>'test',:password_confirmation=>"test"})
            # User.create({:username => 'test',:password =>'test',:password_confirmation=>"test"})
            get :create, {:user=>{:username=>"test", :password=>"test",:password_confirmation=>"test"}}
            expect(response).to render_template("new")
        end
    end

    context '#new' do
        it 'get' do
          get :new, {}
          assigns(:user).should be_a_new(User)
        end
    end

    context '#show' do
        it "assigns the requested user correctly" do
          user = User.create({:username => 'test',:password =>'test'})
          get :show, {:id => user.to_param}
          assigns(:user).should eq(user)
        end
    end
end
