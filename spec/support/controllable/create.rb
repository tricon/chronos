shared_examples "controllable create" do |options = {}|
  let(:object) do
    create(model)
  end

  context "POST :create" do
    before(:each) do
      sign_in create(:user)
    end

    it "responds with redirect" do
      post :create, "#{model}" => attributes_for(model)

      expect(response).to be_redirect
    end

    it "assigns @#{model}" do
      post :create, "#{model}" => attributes_for(model)

      expect(assigns(model)).to_not be_new_record
    end

    it "redirects to the object" do
      post :create, "#{model}" => attributes_for(model)

      expect(response).to redirect_to(polymorphic_path(assigns(model)))
    end
  end
end
