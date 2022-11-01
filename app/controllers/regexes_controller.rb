class RegexesController < ApplicationController
    def index
        @regexes = Regex.all
    end
  
    def show
        id = params[:id] # retrieve regex ID from URI route
        @regex = Regex.find(id) # look up regex by unique ID
        # will render app/views/regexs/show.<extension> by default
        @regex_input = params[:text].nil?? nil: params[:text][:content]
        @validity = Regex.check_integrity(@regex.expression,@regex_input)
    end
    
    def new
        # nothing yet
    end

    def create
        @regex = Regex.create!(regex_params)
        @testcase = Testcase.create(regex_id:@regex.id,content:params[:regex][:testcase][:content],match:params[:regex][:testcase][:match])
        puts @regex.id
        # Normal mass-assignment
        puts params

        
        flash[:notice] = "#{@regex.title} was successfully created."
        redirect_to regexes_path
    end

    def destroy
        @regex = Regex.find(params[:id])
        @regex.destroy
        flash[:notice] = "Regex '#{@regex.title}' deleted."
        redirect_to regexes_path
    end

=begin
    def check
        puts "update function!!!! We are at the check function"
        id = params[:id] # retrieve regex ID from URI route
        @regex = Regex.find(id) # look up regex by unique ID
        # will render app/views/regexs/show.<extension> by default
        # @validity = Regex.check_integrity(@regex.expression, @text)
        # puts params
        redirect_to regex_path(@regex,Hash(:content=>params[:text][:content])) # must be passed by hash
    end
=end

    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def regex_params
        params.require(:regex).permit(:title, :expression, :description, :tag, :testcase, :created_at)

    end
end