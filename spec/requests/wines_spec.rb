require 'rails_helper'
require 'spec_helper'

RSpec.describe "Wines", type: :request do
  
  describe "GET #index" do
    subject { get :index }

    it 'index shows wines' do
      get :index
      expect(subject).to be_successful
    end
    
    it "renders the index template" do
      get :index
      expect(subject).to render_template("wines/index")
    end

  end

  describe "GET #show" do

    it "renders the show template" do
      get :show
      expect(subject).to render_template("wines/show")
    end

  end

end
