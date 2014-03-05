require "spec_helper"

shared_examples "controllable" do |options = {}|
  include Rails.application.routes.url_helpers

  actions = options[:only] ? options[:only] : [:index, :show, :new, :create, :edit, :update, :destroy]

  let(:object) do
    create(model)
  end

  actions -= options[:except] if options[:except]
  actions.each do |action|
    include_examples "controllable #{action.to_s}"
  end
end
