class Admin::GenresController < Admin::BaseController
  def index
    @genres = Genre.all
    @genre = Genre.new
    @admin = current_user
  end
end
