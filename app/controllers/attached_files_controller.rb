class AttachedFilesController < ApplicationController
  # GET /attached_files
  # GET /attached_files.xml
  def index
    @attached_files = AttachedFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attached_files }
    end
  end

  # GET /attached_files/1
  # GET /attached_files/1.xml
  def show
    @attached_file = AttachedFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attached_file }
    end
  end

  # GET /attached_files/new
  # GET /attached_files/new.xml
  def new
    @attached_file = AttachedFile.new(:user_id => session[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attached_file }
    end
  end

  # GET /attached_files/1/edit
  def edit
    @attached_file = AttachedFile.find(params[:id])
  end

  # POST /attached_files
  # POST /attached_files.xml
  def create
    @attached_file = AttachedFile.new(params[:attached_file])

    respond_to do |format|
      if @attached_file.save
        format.html { redirect_to(@attached_file, :notice => 'Attached file was successfully created.') }
        format.xml  { render :xml => @attached_file, :status => :created, :location => @attached_file }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attached_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attached_files/1
  # PUT /attached_files/1.xml
  def update
    @attached_file = AttachedFile.find(params[:id])

    respond_to do |format|
      if @attached_file.update_attributes(params[:attached_file])
        format.html { redirect_to(@attached_file, :notice => 'Attached file was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attached_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attached_files/1
  # DELETE /attached_files/1.xml
  def destroy
    @attached_file = AttachedFile.find(params[:id])
    @attached_file.destroy

    respond_to do |format|
      format.html { redirect_to(attached_files_url) }
      format.xml  { head :ok }
    end
  end
end
