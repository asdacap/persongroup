class PeopleController < ApplicationController
    
    
    def index
        @people=Person.all
        if(params.key?(:search) and !params[:search].empty?) 
            search=params[:search]
            search='%'+search+'%'
            @people=Person.where("name LIKE ? or phone LIKE ? or address LIKE ? ",search,search,search)
        end

        @people=@people.page(params[:page]).per(3)
    end

    def create
        @person=Person.new(person_params)
        if @person.save
            redirect_to person_path(@person.id) 
        else
            render :new
        end
    end

    def new
        @person=Person.new
    end

    def edit
        @person=Person.find(params[:id])
    end

    def show
        @person=Person.find(params[:id])
    end

    def update
        @person=Person.find(params[:id])
        @person.update(person_params) and redirect_to person_path(@person) and return
        render :edit
    end

    def destroy
        @person=Person.find(params[:id])
        @person.destroy
        redirect_to people_path
    end

    private
        def person_params
            params.require(:person).permit(:name,:address,:phone,:group_id)
        end

end
