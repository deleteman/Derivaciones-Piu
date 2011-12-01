class MateriaController < ApplicationController

  before_filter :authenticate_user!

  # GET /materia
  # GET /materia.xml
  def index
    @materia = Materium.all(:order => ["nombre", "nivel"])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @materia }
    end
  end

  # GET /materia/1
  # GET /materia/1.xml
  def show
    @materium = Materium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @materium }
    end
  end

  # GET /materia/new
  # GET /materia/new.xml
  def new
    @materium = Materium.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @materium }
    end
  end

  # GET /materia/1/edit
  def edit
    @materium = Materium.find(params[:id])
  end

  # POST /materia
  # POST /materia.xml
  def create
    @materium = Materium.new(params[:materium])

    respond_to do |format|
      if @materium.save
        format.html { redirect_to(@materium, :notice => 'Materium was successfully created.') }
        format.xml  { render :xml => @materium, :status => :created, :location => @materium }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @materium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /materia/1
  # PUT /materia/1.xml
  def update
    @materium = Materium.find(params[:id])

    respond_to do |format|
      if @materium.update_attributes(params[:materium])
        format.html { redirect_to(@materium, :notice => 'Materium was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @materium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /materia/1
  # DELETE /materia/1.xml
  def destroy
    @materium = Materium.find(params[:id])
    @materium.destroy

    respond_to do |format|
      format.html { redirect_to(materia_url) }
      format.xml  { head :ok }
    end
  end
end
