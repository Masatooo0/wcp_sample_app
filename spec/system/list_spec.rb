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
  describe '投稿画面のテスト' do
    before do
      visit todolists_new_path
    end
    context '表示の確認' do
      it 'todolists_new_pathが"/todolists/new"であるか' do
        expect(current_path).to eq ('/todolists/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'list[title]',with:Faker::Lorem.characters(number:5)
        fill_in 'list[body]',with:Faker::Lorem.characters(number:20)
        click_button '投稿'
        expect(page).to have_current_path todolist_path(List.last)
      end
    end
  end
  describe '一覧画面のテスト' do
    before do
      visit todolists_path
    end
  end
end