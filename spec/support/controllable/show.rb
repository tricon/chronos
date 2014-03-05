shared_examples "controllable show" do |options = {}|
  let(:object) do
    create(model)
  end

  context "GET :show" do
    it "responds with success" do
      get :show, id: object.id

      expect(response).to be_success
    end

    it "assigns @#{model}" do
      get :show, id: object.id

      expect(assigns(model)).to eq(object)
    end

    it "renders the :show template" do
      get :show, id: object.id

      expect(response).to render_template(:show)
    end
  end
end
