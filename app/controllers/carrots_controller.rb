class CarrotsController < ApplicationController
  before_filter :goal_finished, :only => [:show] 
  # GET /carrots
  # GET /carrots.xml
  def index
    @carrots = Carrot.find(:all, :include => :goal, :conditions => ['goals.user_id = (?)', current_user.id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @carrots }
    end
  end

  # GET /carrots/1
  # GET /carrots/1.xml
  def show
    @carrot = Carrot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @carrot }
    end
  end

  def goal_finished
    @carrot = Carrot.find(params[:id]) 
    
    if @carrot.goal.nil?
    	    return false    
    end
    
    if !@carrot.goal.finished
    	    redirect_to root_path	 
    return false    
    end	    
    return @carrot.goal.finished
  end
  
  # GET /carrots/new
  # GET /carrots/new.xml
  def new
    @carrot = Carrot.new(:goal_id => params[:goal_id], :friend_id => params[:friend_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @carrot }
    end
  end

  # GET /carrots/1/edit
  def edit
    @carrot = Carrot.find(params[:id])
  end

  # POST /carrots
  # POST /carrots.xml
  def create
    @carrot = Carrot.new(params[:carrot])

    respond_to do |format|
      if @carrot.save
        format.html { redirect_to(@carrot, :notice => 'Carrot was successfully created.') }
        format.xml  { render :xml => @carrot, :status => :created, :location => @carrot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @carrot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /carrots/1
  # PUT /carrots/1.xml
  def update
    @carrot = Carrot.find(params[:id])

    respond_to do |format|
      if @carrot.update_attributes(params[:carrot])
        format.html { redirect_to(@carrot, :notice => 'Carrot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @carrot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /carrots/1
  # DELETE /carrots/1.xml
  def destroy
    @carrot = Carrot.find(params[:id])
    @carrot.destroy

    respond_to do |format|
      format.html { redirect_to(carrots_url) }
      format.xml  { head :ok }
    end
  end
end
