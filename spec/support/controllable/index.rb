shared_examples "controllable index" do |options = {}|
  let(:object) do
    create(model)
  end

  let(:collection) do
    options[:collection] ||= [object]
  end

  context "GET :index" do
    it "responds with a success" do
      get :index

      expect(response).to be_success
    end

    it "assigns @#{models}" do
      get :index

      expect(assigns(models)).to eq(collection)
    end

    it "renders the :index template" do
      get :index

      expect(response).to render_template(:index)
    end
  end
end
