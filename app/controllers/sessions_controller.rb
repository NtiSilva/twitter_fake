class SessionsController < ApplicationController
    before_action :block_access, except: [:destroy]
    
    def new
    end

    def create 
        @usuario = Usuario.find_by(email: params[:session][:email].downcase)
        if @usuario && @usuario.authenticate(params[:session][:password])
            sign_in
            redirect_to posts_path
        else
            render action: :new
        end
    end
    
    def destroy       
        sign_out
        redirect_to root_path
    end
end
