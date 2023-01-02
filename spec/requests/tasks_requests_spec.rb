require 'rails_helper'

RSpec.describe 'Tasks Requests', type: :request do

  let!(:tasks) { create(:task) }

  describe 'GET /index"' do
    it 'returns http success' do
      get tasks_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_task_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_task_path(tasks)
      expect(response).to have_http_status(:success)
    end
  end
end
