require 'rails_helper'

RSpec.describe "TeamsRequest", type: :request do
  describe 'index' do
    let(:teams) { create_list(:team, 2) }
    before { get '/teams' }
    
    describe 'response' do
      subject { response }
      it { is_expected.to be_ok }
    end

    describe 'teams' do
      subject { assigns(:teams) }
      it { is_expected.to contain_exactly(*teams) }
    end
  end

  describe 'new' do
    before { get '/teams/new' }
    
    describe 'response' do
      subject { response }
      it { is_expected.to be_ok }
    end

    describe 'team' do
      subject { assigns(:team) }
      it { is_expected.to be_a_new(Team) }
    end
  end

  describe 'edit' do
    let(:team) { create(:team) }
    before { get "/teams/#{team.id}/edit" }

    describe 'response' do
      subject { response }
      it { is_expected.to be_ok }
    end

    describe 'team' do
      subject { assigns(:team) }
      it { is_expected.to eq(team) }
    end
  end

  describe 'create' do
    let(:create_request) do
      post "/teams", params: {
        team: attributes_for(:team)
      }
    end

    describe 'change teams count' do 
      it do
        expect {
          create_request
        }.to change(Team, :count).by 1
      end
    end

    describe 'request' do
      before { create_request }

      describe 'response' do
        subject { response }
        it { is_expected.to be_redirect }
      end
    end
  end

  describe 'update' do
    let(:team) { create(:team) }
    let(:new_name) { "New name" }
    before do
      patch "/teams/#{team.id}",
        params: {
          team: {
            name: new_name
          }
        }
    end

    describe 'response' do
      subject { response }
      it { is_expected.to be_redirect }
    end

    describe 'team' do
      subject { team.reload }
      its(:name) { is_expected.to eq new_name }
    end
  end
end
