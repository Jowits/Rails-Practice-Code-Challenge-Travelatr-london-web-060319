class BloggersController < ApplicationController

    def index 
        @bloggers = Blogger.all 
    end

    def new 
        @blogger = Blogger.new
    end 

    def show
        @blogger = Blogger.find(params[:id])
    end

    def create 
        @blogger = Blogger.create(blogger_params)
        if @blogger.valid?
            redirect_to bloggers_path
        else     
            render :new 
        end 
    end 


    private

    def blogger_params
      params.require(:blogger).permit(:name,:age,:bio)
    end
end