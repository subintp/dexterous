require 'spec_helper'

describe HomeController do
    describe "GET index" do
        it "renders home page" do
            get :index
            expect(response.status).to eq 200
            expect(response).to render_template "index"
        end
    end

    describe "GET dashboard" do

        context "when user is not logged in" do

            before :each do
                sign_out :user
            end

            it "redirects to sign in page" do
                get :dashboard
                expect(response.status).to eq 302
            end
        end

        context "when user is logged in" do

            before :each do
                u = build(:user)
                u.save!
                sign_in u
            end

            it "renders dashboard template" do
                get :dashboard
                expect(response.status).to eq 200
                expect(response).to render_template "dashboard"
            end
        end
       
    end
end
