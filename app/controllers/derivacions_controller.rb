class DerivacionsController < ApplicationController

  before_filter :authenticate_user!


  def ver_grupales
	  ids = params[:ids]

	  @alumnos = Array.new
	  if !ids.nil?
		  ids.each do |i|
		  	@alumnos << Alumno.find(i)
		  end
	  end

  end


  # GET /derivacions
  # GET /derivacions.xml
  def index
	@filtrado = false
	if !params[:materium].nil?
		if !params[:materium][:id].nil?
			@filtrado = true
			@materium = Materium.find(params[:materium][:id])
			@derivacions = Derivacion.joins("join materia on materia.id = derivacions.materia_id").joins("join alumnos on alumnos.id = derivacions.alumno_id").where(:materia_id => params[:materium][:id]).order("alumnos.nombre")

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
	if !params[:alumno_nombre].nil?
		@derivacion.alumno = Alumno.find_by_nombre(params[:alumno_nombre])
	end

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
    @derivacion = Derivacion.new
	n_alumno = params[:derivacion][:alumno_nombre]
	
	materias = params[:derivacion][:materias]

	errors = false
	if !materias.nil?
		alumno = Alumno.find_by_nombre(n_alumno)	
		alumno = Alumno.new if alumno.nil?
		alumno.nombre = n_alumno
		if !alumno.save
			@derivacion.errors[:alumno] << alumno.errors[:nombre]
		end

		@derivacion.alumno_id = alumno.id
		materias.each { |m|
			@derivacion = Derivacion.new
			@derivacion.alumno_id = alumno.id
			@derivacion.materia_id = m
			if !@derivacion.save
				errors = true
			end
		}
	else
		errors = true
		@derivacion.errors[:base] << "Se deben seleccionar materias"
	end


	@derivacion.errors[:base] << "El nombre del alumno no puede estar vacio" if n_alumno.empty?

    respond_to do |format|
      #if @derivacion.save
	  if !errors
        format.html { redirect_to(derivacions_path, :notice => 'El alumno fue correctamente derivado.') }
        #format.xml  { render :xml => @derivacion, :status => :created, :location => @derivacion }
      else
        format.html { render :action => "new", :status => :unprocessable_entity, :locals => {:alumno_nombre => "lalal" }}
        #format.xml  { render :xml => @derivacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /derivacions/1
  # PUT /derivacions/1.xml
  def update
    @derivacion = Derivacion.find(params[:id])

    respond_to do |format|
      if @derivacion.update_attributes(params[:derivacion])
        format.html { redirect_to(@derivacion, :notice => 'La derivaci&oacute;n se actualiz&oacute; correctamente.') }
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
