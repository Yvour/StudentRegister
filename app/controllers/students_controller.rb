class StudentsController < ApplicationController
  
  before_action :set_student_from_params, only: [:create, :update]
  before_action :set_student, only: [:show, :edit, :update, :destroy]
 # before_action :up_page, only: [:index]

  # GET /students
  # GET /students.json
  respond_to :html, :xml, :json, :js


  def search1
    last_name0 = params[:last_name].to_s;
    min_grade0 = params[:min_grade].to_i;
    max_grade0 = params[:max_grade].to_i;
    offset0    = params[:offset].to_i;
    @last_name_ids = LastName.where("name like ?", '%' + last_name0 + '%').ids.map{|i| i.to_i}
    if @last_name_ids.size > 0
      @students = Student.all.where(last_name_id: @last_name_ids).order('id').
      where("((average_grade_value between #{min_grade0} and #{max_grade0}) or (average_grade_value is null))"). 
      limit(50).   
      offset(offset0).includes(:grades).includes(:first_name).includes(:last_name)
    end

    
    
    render :index
  end
  
  def index
    @students = Student.all.limit(1)
    
#    @students = Student.paginate(:per_page => 5, :page => params[:page])
    respond_with @students
     #Product.order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
  

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
    
    def set_student_from_params
      @student = Student.new(student_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :student_group_id,
      :first_name_value, :last_name_value, :birthdate, :email, :registration_time, :registration_ip)
    end
    
=begin    
 def up_page 
   session[:page] = case 
                   when params[:new_req] then session[:page]+1
                   when params[:page] then params[:page]
                   else 1
                   end
  end
=end  
end
