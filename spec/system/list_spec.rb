require 'rails_helper'

describe '投稿のテスト' do
  let!(:list){ create(:list,title:'hoge',body:'body') }
  describe 'トップ画面(top_path)のテスト' do
    before do
      visit top_path
    end
    context '表示の確認' do
      it 'トップ画面にここはトップページですが表示されているか' do
        expect(page).to have_content 'ここはトップページです'
      end
      it 'top_pathが"/top"であるか' do
        expect(current_path).to eq('/top')
      end
    end
  end 
end