require 'rails_helper'

RSpec.describe RegexesController, type: :controller do
  def regex_valid_attributes
    {:title => 'test_regex', :expression => 'test_expression'}
  end
  
  def test_case_valid_atributes
    {:content => 'test_testcase', :match => 'false'}
  end

  context '#index' do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  context '#new' do
    it 'get' do
      get :new, {}
      assigns(:regex).should be_a_new(Regex)
    end
  end

  context '#show' do
    it "assigns the requested regex correctly" do
      regex = Regex.create regex_valid_attributes
      get :show, {:id => regex.to_param,:text => {'content':'test_content'}}
      assigns(:regex).should eq(regex)
    end
    context "creates the requested testcase correctly" do
      it "works when no input" do
        
        controller.instance_eval do
          @validity = 'No input.'
        end
        regex = Regex.create regex_valid_attributes
        get :show, {:id => regex.to_param,:text => {'content':'test_content'}, :commit => "Add to testcase"}
        expect(Testcase).not_to receive(:create)
      end
      it "works when no match" do
        controller.instance_eval do
          @validity = 'No match!'
        end
        regex = Regex.create regex_valid_attributes
        get :show, {:id => regex.to_param,:text => {'content':'test_content'}, :commit => "Add to testcase"}
        testcase = Testcase.create :regex_id => regex.to_param,:content => 'test_content', :match => 'false'
        allow(Testcase).to receive(:create).and_return testcase
      end
      it "works when matches" do
        controller.instance_eval do
          @validity = 'Matches!'
        end
        regex = Regex.create regex_valid_attributes
        get :show, {:id => regex.to_param,:text => {'content':'test_expression'}, :commit => "Add to testcase"}
        testcase = Testcase.create :regex_id => regex.to_param, :content => 'test_expression', :match => 'true'
        allow(Testcase).to receive(:create).and_return testcase

      end
    end
  end



  context '#create' do
      describe 'Regex is created' do
         it 'executes the creation query against the database' do
             regex = double('regex',:title => "fake regex", :content => "fake content")
             expect(Regex).to receive(:create!).with({title: "fake regex"}).and_return regex
             post :create, {regex: {title:"fake regex", content:"fake content"}}
         end

         it 'assign the regex to the template' do
             regex = double('regex',:title => "fake regex", :content => "fake content")
             expect(Regex).to receive(:create!).with({title: "fake regex"}).and_return regex
             post :create, {regex: {title:"fake regex", content:"fake content"}}
             expect(assigns(:regex)).to eq regex
         end

         it 'redirects to the homepage' do
             post :create, {regex: {title:"fake regex", content:"fake content"}}
             expect(response).to redirect_to regexes_path
         end
      end
  end

  # delete some examples
  context '#destroy' do
      describe 'regex is destroyed' do

         it 'executes the deletion query against the database' do
             regex = double('regex', :title => "fake regex", :content => "fake content")
             allow(Regex).to receive(:find).and_return regex
             expect(regex).to receive(:destroy)
             delete :destroy, { id: 1 }
         end

         it 'assign the regex to the template' do
             regex = double('regex', :title => "fake regex", :content => "fake content")
             allow(Regex).to receive(:find).and_return regex
             expect(regex).to receive(:destroy)
             delete :destroy, { id: 1 }
             expect(assigns(:regex)).to eq regex
         end

         it 'redirects to the homepage' do
             regex = double('regex', :title => "fake regex", :content => "fake content")
             allow(Regex).to receive(:find).and_return regex
             expect(regex).to receive(:destroy)
             delete :destroy, { id: 1 }
             expect(response).to redirect_to regexes_path
         end
      end
  end

end
