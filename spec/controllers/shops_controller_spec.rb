require 'rails_helper'

RSpec.describe ShopsController, type: :controller do
	describe '詳細ページ' do
		context "詳細ページが正しく表示される" do
			before do
				get :new
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end
	end

end
