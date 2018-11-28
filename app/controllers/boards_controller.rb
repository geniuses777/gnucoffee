class BoardsController < ApplicationController
    $message=true
    def create_at
       data = Board.new
       data.title = params[:title]
       data.content = params[:content]
       data.user = current_user.name
       data.save
       
       redirect_to '/boards/list'
    end
    def list
        @all = Board.all 
        @count = 0
        @message=$message
        puts @message
        puts "작성자가 아냐"
    end
    $message = true
    def show
        @special = Board.find params[:id]
    end
    def update
       @one = Board.find params[:id]
       if @one.user != current_user.name
           $message=false
           redirect_to '/boards/list'
       end
    end
    def update_at
       two = Board.find params[:id]
       two.title = params[:title]
       two.content = params[:content]
       two.save
       
       redirect_to "/boards/show/#{two.id}"
    end
    def delete
       zero = Board.find params[:id]
       zero.destroy()
       
       redirect_to '/boards/list'
    end
end
