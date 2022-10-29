class RegexesController < ApplicationController
    def index
        @regexes = Regex.all
    end
  
    def show
        id = params[:id] # retrieve regex ID from URI route
        @regex = Regex.find(id) # look up regex by unique ID
        # will render app/views/regexs/show.<extension> by default
    end
    
    def new
        # nothing yet
    end

    def create
        @regex = Regex.create!(regex_params)
        flash[:notice] = "#{@regex.title} was successfully created."
        redirect_to regexes_path
    end

    def destroy
        @regex = Regex.find(params[:id])
        @regex.destroy
        flash[:notice] = "Regex '#{@regex.title}' deleted."
        redirect_to regexes_path
    end

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def regex_params
        params.require(:regex).permit(:title, :expression, :description, :tag, :created_at)
    end
end