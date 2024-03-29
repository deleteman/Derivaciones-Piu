class ProfesorsController < ApplicationController

  before_filter :authenticate_user!

  # GET /profesors
  # GET /profesors.xml
  def index
    @profesors = Profesor.where(:year => session[:current_year])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profesors }
    end
  end

  # GET /profesors/1
  # GET /profesors/1.xml
  def show
    @profesor = Profesor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profesor }
    end
  end

  # GET /profesors/new
  # GET /profesors/new.xml
  def new
    @profesor = Profesor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profesor }
    end
  end

  # GET /profesors/1/edit
  def edit
    @profesor = Profesor.find(params[:id])
  end

  # POST /profesors
  # POST /profesors.xml
  def create
    @profesor = Profesor.new(params[:profesor])

    respond_to do |format|
      if @profesor.save
        format.html { redirect_to(@profesor, :notice => 'Profesor was successfully created.') }
        format.xml  { render :xml => @profesor, :status => :created, :location => @profesor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profesor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profesors/1
  # PUT /profesors/1.xml
  def update
    @profesor = Profesor.find(params[:id])

    respond_to do |format|
      if @profesor.update_attributes(params[:profesor])
        format.html { redirect_to(@profesor, :notice => 'Profesor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profesor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profesors/1
  # DELETE /profesors/1.xml
  def destroy
    @profesor = Profesor.find(params[:id])
    @profesor.destroy

    respond_to do |format|
      format.html { redirect_to(profesors_url) }
      format.xml  { head :ok }
    end
  end
end
