class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :usuario_logado, except: [:new, :create]

    def index
        @usuarios = Usuario.all
    end

    def new
        @usuario = Usuario.new
    end
    
    def show
    end

    def edit
    end

    def create
        @usuario = Usuario.new(usuario_params)
        if @usuario.save
            redirect_to @usuario
        else
            render :new 
        end      
    end

    def update
        if @usuario.update(usuario_params)
            redirect_to @usuario
        else
            render :edit 
        end
    end

    def destroy
        @usuario.destroy
        redirect_to root_path
    end

#########################################################################################################

  private

    def set_usuario
        @usuario = Usuario.find(params[:id])
    end

    def usuario_params
        params.require(:usuario).permit(:nome, :email, :password, :password_confirmation)
    end
end
