class HorarioMateriaController < ApplicationController

  before_filter :authenticate_user!

  # GET /horario_materia
  # GET /horario_materia.xml
  def index
    @horario_materia = HorarioMaterium.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @horario_materia }
    end
  end

  # GET /horario_materia/1
  # GET /horario_materia/1.xml
  def show
    @horario_materium = HorarioMaterium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @horario_materium }
    end
  end

  # GET /horario_materia/new
  # GET /horario_materia/new.xml
  def new
    @horario_materium = HorarioMaterium.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @horario_materium }
    end
  end

  # GET /horario_materia/1/edit
  def edit
    @horario_materium = HorarioMaterium.find(params[:id])
  end

  # POST /horario_materia
  # POST /horario_materia.xml
  def create
	  
	  print params.inspect
    @horario_materium = HorarioMaterium.new(params[:horario_materium])

    respond_to do |format|
      if @horario_materium.save
        format.html { redirect_to(@horario_materium, :notice => 'Horario materium was successfully created.') }
        format.xml  { render :xml => @horario_materium, :status => :created, :location => @horario_materium }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @horario_materium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /horario_materia/1
  # PUT /horario_materia/1.xml
  def update
    @horario_materium = HorarioMaterium.find(params[:id])

    respond_to do |format|
      if @horario_materium.update_attributes(params[:horario_materium])
        format.html { redirect_to(@horario_materium, :notice => 'Horario materium was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @horario_materium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /horario_materia/1
  # DELETE /horario_materia/1.xml
  def destroy
    @horario_materium = HorarioMaterium.find(params[:id])
    @horario_materium.destroy

    respond_to do |format|
      format.html { redirect_to(horario_materia_url) }
      format.xml  { head :ok }
    end
  end
end
