require 'rails_helper'

RSpec.describe CadaversController, type: :controller do
  login_user
  let(:valid_attributes) {{ first_name: 'Dead', age: 76, healthy: true, whole: true, fresh: true }}
  let(:invalid_attributes) {{ first_name: '', age: 79, healthy: true, whole: true, fresh: true }}
  let (:body) { @user.cadavers.create! valid_attributes }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: body.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: body.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new cadaver" do
        expect {
          post :create, params: { cadaver: valid_attributes }
        }.to change(Cadaver, :count).by(1)
      end

      it "redirects to the created Cadaver" do
        post :create, params: { cadaver: valid_attributes }
        expect(response).to redirect_to(Cadaver.last)
      end
    end

    context "with invalid params" do
      it "does not create a new Cadaver" do
        expect {
          post :create, params: { cadaver: invalid_attributes }
        }.to change(Cadaver, :count).by(0)
      end

      it "returns a success response" do
        post :create, params: { cadaver: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{ age: 55 }}

      it "updates the requested cadaver" do
        put :update, params: { id: body.id, cadaver: new_attributes }
        expect(body.reload.age).to eq(new_attributes[:age])
      end

      it "redirects to cadaver" do
        body
        put :update, params: { id: body.id, cadaver: new_attributes}
        expect(response).to redirect_to(body)
      end
    end

    context "with invalid params" do
      it "does not update the cadaver" do
        body
        put :update, params: { id: body.id, cadaver: invalid_attributes}
        expect(body.first_name).to_not eq(invalid_attributes[:first_name])
      end

      it "returns success to load edit template" do
        body
        put :update, params: { id: body.id, cadaver: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cadaver" do
      body
      expect { delete :destroy, params: { id: body.id} }.to change(
      Cadaver, :count).by(-1)
    end

    it "redirects to cadaver index" do
      delete :destroy, params: { id: body.id }
      expect(response).to redirect_to(cadavers_url)
    end
  end

end
