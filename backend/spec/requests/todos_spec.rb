require 'rails_helper'

RSpec.describe "Todos", type: :request do
  describe "GET /todos" do
    it "returns all todos as JSON" do
      create(:todo, title: "Buy milk")
      create(:todo, title: "Walk the dog")

      get "/todos"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.length).to eq(2)
    end
  end

  describe "POST /todos" do
    it "creates a todo with valid params" do
      expect {
        post "/todos", params: { todo: { title: "Read a book" } }
      }.to change(Todo, :count).by(1)

      expect(response).to have_http_status(:created)
    end

    it "returns errors with invalid params" do
      post "/todos", params: { todo: { title: "" } }

      expect(response).to have_http_status(:unprocessable_content)
    end
  end
end