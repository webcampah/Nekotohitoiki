require 'rails_helper'

RSpec.describe Comment, type: :model do
	context "データが正しく保存されない" do
		before do
			@comment = Comment.new
			@comment.content = ""
			@comment.save
		end
		it "shopとuserが不明でcontent未入力なので保存されない" do
			expect(@comment).to be_invalid
			expect(@comment.errors[:content]).to include("が入力されていません。")
		end
	end
end
