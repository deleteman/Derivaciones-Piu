class DerivacionsController < ApplicationController

  before_filter :authenticate_user!

  # GET /derivacions
  # GET /derivacions.xml
  def index


	if !params[:materium].nil?
		if !params[:materium][:id].nil?
			#@derivacions = Derivacion.find_all_by_nivel(params[:nivel])
			@materium = Materium.find(params[:materium][:id])
			@derivacions = Derivacion.joins("join materia on materia.id = derivacions.materia_id").where(:materia_id => params[:materium][:id]).where({:materia => {:nivel => params[:materium][:nivel]}})
		end
	else
    	@derivacions = Derivacion.all
	end
	  

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @derivacions }
    end
  end

  # GET /derivacions/1
  # GET /derivacions/1.xml
  def show
    @derivacion = Derivacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @derivacion }
    end
  end

  # GET /derivacions/new
  # GET /derivacions/new.xml
  def new
    @derivacion = Derivacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @derivacion }
    end
  end

  # GET /derivacions/1/edit
  def edit
    @derivacion = Derivacion.find(params[:id])
  end

  # POST /derivacions
  # POST /derivacions.xml
  def create
    @derivacion = Derivacion.new(params[:derivacion])

    respond_to do |format|
      if @derivacion.save
        format.html { redirect_to(@derivacion, :notice => 'Derivacion was successfully created.') }
        format.xml  { render :xml => @derivacion, :status => :created, :location => @derivacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @derivacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /derivacions/1
  # PUT /derivacions/1.xml
  def update
    @derivacion = Derivacion.find(params[:id])

    respond_to do |format|
      if @derivacion.update_attributes(params[:derivacion])
        format.html { redirect_to(@derivacion, :notice => 'Derivacion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @derivacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /derivacions/1
  # DELETE /derivacions/1.xml
  def destroy
    @derivacion = Derivacion.find(params[:id])
    @derivacion.destroy

    respond_to do |format|
      format.html { redirect_to(derivacions_url) }
      format.xml  { head :ok }
    end
  end
end
