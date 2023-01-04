require 'rails_helper'

RSpec.describe TasksController, type: :feature do

  describe 'タスク一覧画面の表示' do
    context 'タスクコンテンツが1個も登録されていない場合' do

      it 'テーブルに0個のコンテンツが表示される' do
        visit tasks_path
        expect(find('tbody').all('tr').size).to eq(0)
      end

    end

    context 'タスクコンテンツが10個登録されている場合' do
      let!(:tasks) { create_list(:task, 10) }
  
      it 'テーブルに10個のコンテンツが表示される' do
        visit tasks_path
        expect(find('tbody').all('tr').size).to eq(10)
      end

      it 'テーブルの1列目にタスク名が表示される' do
        visit tasks_path
        expect(find('tbody').all('tr')[0].all('td')[0]).to have_content 'タイトル20'
        expect(find('tbody').all('tr')[1].all('td')[0]).to have_content 'タイトル19'
        expect(find('tbody').all('tr')[2].all('td')[0]).to have_content 'タイトル18'
        expect(find('tbody').all('tr')[3].all('td')[0]).to have_content 'タイトル17'
        expect(find('tbody').all('tr')[4].all('td')[0]).to have_content 'タイトル16'
        expect(find('tbody').all('tr')[5].all('td')[0]).to have_content 'タイトル15'
        expect(find('tbody').all('tr')[6].all('td')[0]).to have_content 'タイトル14'
        expect(find('tbody').all('tr')[7].all('td')[0]).to have_content 'タイトル13'
        expect(find('tbody').all('tr')[8].all('td')[0]).to have_content 'タイトル12'
        expect(find('tbody').all('tr')[9].all('td')[0]).to have_content 'タイトル11'
      end
    end
  end

  describe '新規タスクの登録' do
    context 'すべての入力フォームに値を入力する場合' do

      it '新規タスクが1件登録される' do
        visit new_task_path
        fill_in 'Title', with: '新規登録_タイトル'
        click_on 'Create Task'
        expect(find('tbody').all('tr').size).to eq(1)
        expect(find('tbody').all('tr')[0].all('td')[0]).to have_content '新規登録_タイトル'
      end
    end
  end

  describe '登録済みタスクの編集' do
    context 'タイトルの値を編集する場合' do
      let!(:task) { create(:task) }

      it 'タイトルの値が更新される' do
        visit tasks_path
        click_on '編集'
        fill_in 'Title', with: '編集_タイトル'
        click_on 'Update Task'
        expect(find('tbody').all('tr').size).to eq(1)
        expect(find('tbody').all('tr')[0].all('td')[0]).to have_content '編集_タイトル'
      end
    end
  end

  describe '登録済みタスクの削除' do
    let!(:task) { create(:task) }
  
    it 'タスクが削除される' do
      visit tasks_path
      click_on '削除'
      expect(find('tbody').all('tr').size).to eq(0)
    end
  end
end
