

class GoalsController < ApplicationController
  # GET /goals
  # GET /goals.xml
  def index	  
    @goals = Goal.find(:all, :conditions => ['goals.user_id = (?)', current_user.id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goals }
    end
  end

  # GET /goals/1
  # GET /goals/1.xml
  def show
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.xml
  def new
    @goal = Goal.new(:user_id => current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.xml
  def create
    @goal = Goal.new(params[:goal])

    respond_to do |format|
      if @goal.save
      	
      	user_name = @goal.user.first_name + ' ' + @goal.user.last_name
      	title = @goal.title
      	mes = @goal.message
      	#goal_friend_phone = @goal.friend.phone
      	randnum = rand(10000).to_s;
      	goal_id = @goal.id
      	
      	# Message for accountability agent
      	#if goal_friend_phone
        #  message = 'Will you be my ('+ user_name + ') accountability agent on DangleCarrot.com for my new goal: ' + title     
      	#  phone = goal_friend_phone
       	#  url = 'https://api.tropo.com/1.0/sessions?action=create&token=0452fe7820523740b9b540e50072440c154005259a1b2ac08ca573e69cf7a3428f3637927a92c9d6c4704b05&numberToDial=' + phone + '&msg=' + message
      	#  response = RestClient.get URI.encode(url)   
        #end
      	  
      	# Message for carrots
      	@goal.user.friends.each do |user|
         if user.phone	
      	  link = 'http://' + request.domain + '/c/' + goal_id.to_s + '/' + user.id.to_s 
      	  message = 'Dangle a Carrot for ' + user_name + ' on DangleCarrot.com by clicking this link: ' + link + '   ' + mes + ' ref#: ' + randnum      
      	  phone = user.phone
      	  url = 'https://api.tropo.com/1.0/sessions?action=create&token=0452fe7820523740b9b540e50072440c154005259a1b2ac08ca573e69cf7a3428f3637927a92c9d6c4704b05&numberToDial=' + phone + '&msg=' + message
      	  response = RestClient.get URI.encode(url)
         end
        end
	
      	format.html { redirect_to(@goal, :notice => 'Goal was successfully created.') }
        format.xml  { render :xml => @goal, :status => :created, :location => @goal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.xml
  def update
    @goal = Goal.find(params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to(@goal, :notice => 'Goal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.xml
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to(goals_url) }
      format.xml  { head :ok }
    end
  end
end
