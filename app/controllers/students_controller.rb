class StudentsController < ApplicationController


    def index 
        students = Student.all 
        render json: students, status: :ok
    end

    def show 
        student = Student.find_by(id: student_id)
        if student
            render json: student, status: :ok 
        else  
            rendor json: {error: "Student not found"}, status: :not_found
        end
    end
    

    def update 
        student = Student.find_by(id: student_id)
        if student
            student.update(student_params)
            render json: student
        else 
            render json: {error: "No student found"}, status: :not_found
        end
    end


    def create 
        student = Student.create(student_params)
        if student.valid?
            render json: student, status: :created
        else 
            render json: student.errors
        end
    end

    def destroy 

        student = Student.find_by(id: instructor_id)

        if student 
            student.destroy
            head :no_content 
        else  
            render json: {error: :not_found}
        end

    end

    private

    def student_params
        params.permit(:name)
    end

    def student_id
        params[:id]
    end

end
