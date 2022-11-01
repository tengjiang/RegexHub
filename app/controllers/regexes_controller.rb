class RegexesController < ApplicationController

    def show
        id = params[:id] # retrieve regex ID from URI route
        @regex = Regex.find(id) # look up regex by unique ID
        # will render app/views/regexs/show.<extension> by default
        @regex_input = params[:text].nil?? nil: params[:text][:content]
        @validity = Regex.check_integrity(@regex.expression,@regex_input)
    end

    def index

      @regexes = Regex.all
      @all_tags = Regex.all_tags

      if params[:commit] == 'Refresh' and params[:tags].nil?
        #p "r1"
        @tags_to_show = @all_tags
        session[:tags] = @tags_to_show
      end

      if params[:tags].nil? and params[:sort].nil?
        p "t1"
        if not session[:tags].nil?
          p "t2"
          @tags_to_show = session[:tags]
        else
          p "t3"
          @tags_to_show = @all_tags
          session[:tags] = @tags_to_show
        end

        r = Hash[ *session[:tags].collect { |v| [ v, 1 ] }.flatten ]
        redirect_to regexes_path(:sort => session[:sort], :tags => r)
      else
        p "t4"
        if params[:tags].nil?
          @tags_to_show = session[:tags]
        else
          p params[:tags]
          @tags_to_show = params[:tags].keys
        end
      end

      @sort = params[:sort] || session[:sort]
      case @sort
      when 'name'
        ordering = {:name => :asc}
      when 'uploaded_time'
        ordering = {:uploaded_time => :asc}
      end

      @regexes = Regex.with_tags(@tags_to_show).order(ordering)

      session[:sort]    = @sort
      session[:tags] = @tags_to_show
      @tags = @tags_to_show
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
        params.require(:regex).permit(:title, :expression, :description, :tag, :created_at)
    end
end
