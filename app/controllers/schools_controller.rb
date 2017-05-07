class SchoolsController < ApplicationController

    before_action :set_school, only: [:show, :edit, :update, :destroy]

    def index
        @active_schools = School.active.alphabetical
        @inactive_schools = School.inactive.alphabetical
    end

    def show
    end

    def edit
    end

    def new
        @school = School.new
    end

    def create
        @school = School.new(school_params)

        respond_to do |format|
            if @school.save
                format.html { redirect_to @school, notice: 'School was successfully created.' }
                format.js 
            else
                render action: 'new'
            end
        end
    end

    def update
    end

    def destroy
    end

    private
    def school_params
        params.require(:school).permit(:name, :street_1, :street_2, :city, :state, :zip, :min_grade, :max_grade, :active)
    end

    def set_school 
        @school = School.find(params[:id])
    end
end