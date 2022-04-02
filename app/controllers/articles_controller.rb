class ArticlesController < ApplicationController

   def index
    flash[:notice] = "ログイン済ユーザーのみ記事の詳細を確認できます" unless user_signed_in?
   end

end
