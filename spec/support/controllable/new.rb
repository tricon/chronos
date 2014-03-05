shared_examples "controllable new" do |options = {}|
  let(:object) do
    create(model)
  end

  context "GET :new" do
    it "responds with success" do
      get :new, id: object.id

      expect(response).to be_success
    end

    it "assigns @#{model}" do
      get :new, id: object.id

      expect(assigns(model)).to be_a_new(model_class)
    end

    it "renders the :new template" do
      get :new, id: object.id

      expect(response).to render_template(:new)
    end
  end
end
