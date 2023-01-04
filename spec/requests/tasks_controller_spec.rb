require 'rails_helper'

RSpec.describe TasksController, type: :request do

  let!(:tasks) { create(:task) }
  let(:post_params) { { task: { title: 'テストタイトル' } } }

  describe 'GET /tasks"' do
    it 'render index template' do
      get tasks_path
      expect(response).to render_template(:index)
    end

    it 'returns http success' do
      get tasks_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /tasks/new' do
    it 'render new template' do
      get new_task_path
      expect(response).to render_template(:new)
    end

    it 'returns http success' do
      get new_task_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /tasks/:id/edit' do
    it 'render edit template' do
      get edit_task_path(tasks)
      expect(response).to render_template(:edit)
    end

    it 'returns http success' do
      get edit_task_path(tasks)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /tasks' do
    it 'redirect to tasks index' do
      post tasks_path(post_params)
      expect(response).to redirect_to(tasks_path)
    end
  end

  describe 'DELETE /tasks/:id' do
    it 'redirect to tasks index' do
      delete task_path(tasks)
      expect(response).to redirect_to(tasks_path)
    end
  end
end
