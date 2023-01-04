require 'rails_helper'

RSpec.describe 'Tasks Features', type: :feature do

  describe 'GET /tasks"' do
    context 'タスクコンテンツが1個も登録されていない時' do

      it 'テーブルに0個のコンテンツが表示される' do
        visit tasks_path
        expect(find('tbody').all('tr').size).to eq(0)
      end

    end

    context 'タスクコンテンツが10個登録されている時' do

      let!(:tasks) { create_list(:task, 10) }
  
      it 'テーブルに10個のコンテンツが表示される' do
        visit tasks_path
        expect(find('tbody').all('tr').size).to eq(10)
      end

      it '1列目にタスク名が表示される' do
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
end
