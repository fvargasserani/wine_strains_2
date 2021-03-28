require 'rails_helper'
require 'spec_helper'

RSpec.describe "Wines", type: :request do
  
  describe "GET #index" do

    get :index

    it 'index shows wines' do
      expect(subject).to 
    end
    
    it "renders the index template" do
      expect(subject).to render_template("wines/index")
    end

  end

  describe "GET #show" do

    get :show
    
    it "renders the show template" do
      expect(subject).to render_template("wines/show")
    end

  end

end
