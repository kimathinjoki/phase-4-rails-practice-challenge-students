class InstructorsController < ApplicationController


    def index 
        instructors = Instructor.all 
        render json: instructors, status: :ok
    end

    def show 
        instructor = Instructor.find_by(id: instructor_id)
        if instructor
            render json: instructor, status: :ok 
        else  
            rendor json: {error: "Instructor not found"}, status: :not_found
        end
    end
    

    def update 
        instructor = Instructor.find_by(id: instructor_id)
        if instructor
            instructor.update(instructor_params)
            render json: instructor
        else 
            render json: {error: "No instructor found"}, status: :not_found
        end
    end


    def create 
        instructor = Instructor.create(instructor_params)
        if instructor.valid?
            render json: instructor, status: :created
        else 
            render json: instructor.errors
        end
    end

    def destroy 

        instructor = Instructor.find_by(id: instructor_id)

        if instructor 
            instructor.destroy
            head :no_content 
        else  
            render json: {error: :not_found}
        end

    end

    private

    def instructor_params
        params.permit(:name)
    end

    def instructor_id
        params[:id]
    end

end
