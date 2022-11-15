require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    context '#create' do
        it 'successful create a user' do
            get :create, {:user=>{:username=>"test", :password=>"test",:password_confirmation=>"test"}}
            expect(response).to redirect_to regexes_path
        end
        it 'cannot create a user when the passowrd is wrong' do
            get :create, {:user=>{:username=>"test", :password=>"test",:password_confirmation=>"test1"}}
            expect(response).to render_template("new")
        end
    end

end
