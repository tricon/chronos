shared_examples "controllable destroy" do |options = {}|
  let(:object) do
    create(model)
  end

  context "DELETE :destroy" do
    it "responds with redirect" do
      delete :destroy, id: object.id

      expect(response).to be_redirect
    end

    it "redirects to index" do
      delete :destroy, id: object.id

      expect(response).to redirect_to(polymorphic_path(models))
    end

    it "removes an object" do
      delete :destroy, id: object.id

      expect(assigns(model).destroyed?).to be_true
    end
  end
end
