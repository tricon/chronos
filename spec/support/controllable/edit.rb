shared_examples "controllable edit" do |options = {}|
  let(:object) do
    create(model)
  end

  context "GET :edit" do
    it "responds with success" do
      get :edit, id: object.id

      expect(response).to be_success
    end

    it "assigns @#{model}" do
      get :edit, id: object.id

      expect(assigns(model)).to eq(object)
    end

    it "renders the :edit template" do
      get :edit, id: object.id

      expect(response).to render_template(:edit)
    end
  end
end
