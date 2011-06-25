

class GoalsController < ApplicationController
  # GET /goals
  # GET /goals.xml
  def index
    @goals = Goal.all

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
      	      
      	require 'net/https'
      	url = URI.parse("https://api.tropo.com/1.0/sessions?action=create&token=0452fe7820523740b9b540e50072440c154005259a1b2ac08ca573e69cf7a3428f3637927a92c9d6c4704b05&numberToDial=4804148157&msg=this+is+a+test+message+from+carrot+dangle2134")
	request = Net::HTTP::Post.new(url.path,{"Content-Type"=>"text/xml"})
	http = Net::HTTP.new(url.host, url.port)
	http.use_ssl = true
	response = http.start {|http| http.request(request) }
	
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
