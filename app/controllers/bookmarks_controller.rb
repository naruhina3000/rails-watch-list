class BookmarksController < ApplicationController

    def new
        @bookmark = Bookmark.new
    end

    def create
        @bookmark = Bookmark.new(bookmark_params)
        
        @list = List.find(params[:list_id])
        @bookmark.list = @list
        if @bookmark.save
            redirect_to @list
        else
            render "new"
        end
    end

    def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.destroy
        redirect_to @bookmark.list
    end

    private

    def bookmark_params
        params.require(:bookmark).permit(:comment, :movie_id)
    end

#   POST create
#     with valid params
#       creates a new bookmark (FAILED - 2)
#       assigns a newly created bookmark as @bookmark (FAILED - 3)
#       redirects to the created list (FAILED - 4)
end
