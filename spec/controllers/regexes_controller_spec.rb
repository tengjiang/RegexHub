require 'rails_helper'

RSpec.describe RegexesController, type: :controller do

  # add some examples
  context '#create' do
      describe 'Regex is created' do
         it 'executes the creation query against the database' do
             regex = double('regex', :title => "fake regex")
             expect(Regex).to receive(:create!).with({title: "fake regex"}).and_return regex
             post :create, {regex: {title: "fake regex"}}
         end

         it 'assign the regex to the template' do
             regex = double('regex', :title => "fake regex")
             expect(Regex).to receive(:create!).with({title: "fake regex"}).and_return regex
             post :create, {regex: {title: "fake regex"}}
             expect(assigns(:regex)).to eq regex
         end

         it 'redirects to the homepage' do
             post :create, {regex: {title: "fake regex"}}
             expect(response).to redirect_to regexes_path
         end
      end
  end

  # delete some examples
  context '#destroy' do
      describe 'regex is destroyed' do

         it 'executes the deletion query against the database' do
             regex = double('regex', :title => "fake regex")
             allow(Regex).to receive(:find).and_return regex
             expect(regex).to receive(:destroy)
             delete :destroy, { id: 1 }
         end

         it 'assign the regex to the template' do
             regex = double('regex', :title => "fake regex")
             allow(Regex).to receive(:find).and_return regex
             expect(regex).to receive(:destroy)
             delete :destroy, { id: 1 }
             expect(assigns(:regex)).to eq regex
         end

         it 'redirects to the homepage' do
             regex = double('regex', :title => "fake regex")
             allow(Regex).to receive(:find).and_return regex
             expect(regex).to receive(:destroy)
             delete :destroy, { id: 1 }
             expect(response).to redirect_to regexes_path
         end
      end
  end

end
