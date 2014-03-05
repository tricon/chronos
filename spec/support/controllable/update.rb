shared_examples "controllable update" do |options = {}|
  let(:object) do
    create(model)
  end

  context "PUT :update" do
    it "responds with redirect" do
      put :update, id: object.id, "#{model}" => { name: "Updated Task" }

      expect(response).to be_redirect
    end

    it "assigns @#{model}" do
      put :update, id: object.id, "#{model}" => { name: "Updated Task" }

      expect(assigns(model)).to eq(object)
    end

    it "updates the object" do
      put :update, id: object.id, "#{model}" => { name: "Updated Task" }

      expect(assigns(model).name).to eq ("Updated Task")
    end

    it "redirects to the object" do
      put :update, id: object.id, "#{model}" => { name: "Updated Task" }

      expect(response).to redirect_to(polymorphic_path(object))
    end
  end
end
