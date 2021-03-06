class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :destroy, :create, :home, :learnmore]		
  # GET /users
  # GET /users.xml
  def home
    if current_user	 
      redirect_to user_path(current_user)	    
      return
    end	 
  end
  
  def learnmore
  end
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new
    if current_user	 
      redirect_to user_path(current_user)	    
      return
    end	  
    @user = User.new
  end
 
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id	    
      redirect_to new_goal_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
