require 'rails_helper'

RSpec.describe LikesController, type: :controller do
    context '#create' do
        it 'redirect to login page if not logged in' do
            get :create, {:like=>{:regex_id=>"1 "},:add_testcase=>"Add testcase"}
            expect(response).to redirect_to login_path
        end
        it 'successfully like if logged in' do
            allow(User).to receive(:create)
            User.create!({:username => 'test',:password =>'test',:password_confirmation=>"test"})
            allow(Regex).to receive(:create)
            Regex.create!({:title => 'test_regex', :expression => 'test_expression',:tag => 'other', :user_id =>1})
            session[:user_id] = 1
            get :create, {:like=>{:regex_id=>"1 "},:add_testcase=>"Add testcase"}
            expect(response).to redirect_to '/regexes/1'
        end
    end

    context '#create' do
        it 'executes the deletion query against the database' do
            session[:user_id] = 1
            allow(User).to receive(:create)
            User.create!({:username => 'test',:password =>'test',:password_confirmation=>"test"})
            allow(Regex).to receive(:create)
            Regex.create!({:title => 'test_regex', :expression => 'test_expression',:tag => 'other', :user_id =>1})
            like = Like.create({:id => 1, :regex_id => 1, :user_id => 1})
            allow(Like).to receive(:find).and_return like
            expect {
                delete :destroy, id: 1
              }.to change(Like, :count).by(-1)
            end
        it 'successfully destroy' do
            allow(User).to receive(:create)
            User.create!({:username => 'test',:password =>'test',:password_confirmation=>"test"})
            allow(Regex).to receive(:create)
            Regex.create!({:title => 'test_regex', :expression => 'test_expression',:tag => 'other', :user_id =>1})
            session[:user_id] = 1
            like = Like.create!({:regex_id => 1, :user_id => 1})
            allow(Like).to receive(:find).and_return like
            delete :destroy, {id: 1}
            expect(response).to redirect_to '/regexes/1'
        end
    end
end
