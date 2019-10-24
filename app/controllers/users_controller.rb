class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
      end


    def new 
        @user = User.new
    end

    def create
        
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome on board"
            session[:user_id] = @user.id
            redirect_to posts_path	
        else
            redirect_to new_user_path(@user)
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end 








    def process_login  

        user = User.authenticate(params[:email], params[:password])  
      
       if user  
        
          session[:user_id] = user.id  
        
          redirect_to posts_path	
        
       else  
       
          flash.now.alert = "Invalid email or password"  
       
          render "login"  
       
        end  
    
      end  
      
      def my_account
         
          if session[:user_id] != nil
         
             @sessName = User.find(session[:user_id]).username
         
          else
          
             @sessName = "Guest"
          
          end
      
      end














end
