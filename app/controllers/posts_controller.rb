class PostsController < ApplicationController
    before_action :set_usuario, only: [:create, :destroy]
    before_action :usuario_logado
    def index
        @post = Post.all
    end
    
    def api
        @post = Post.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Artigos carregados', data: @post},status: :ok		
    end

    def show
    end

    def new
        @post = Post.new
    end

    def edit
    end

     def create
        @post = Post.new(post_params)
        respond_to do |format|
            @post.usuario_id =  current_user.id
            if @post.save
                format.html { redirect_to posts_path, notice: 'Tweeted' }
                format.json { render main_path(@user), status: :created, location: root_path }
            else
                format.html { redirect_to posts_path, notice: 'Tweeted' }
                format.json { render json: main_path(@user.errors), status: :unprocessable_entity }
            end
        end
    end

    def update
        if @post.update(post_params)
        redirect_to @post
      else
        render :edit 
      end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end
    
###############################################################################33
    private
    
     def set_usuario
         @usuario = Usuario.find(params[:usuario_id])
     end

    def post_params
        params.require(:post).permit(:text, :usuario_id)
    end  
    
end
