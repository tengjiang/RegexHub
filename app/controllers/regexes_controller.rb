class RegexesController < ApplicationController
=begin
    def index
        @regexes = Regex.all
        @regex_input = []
        
        @regex_input = params[:text].nil?? Hash.new: params[:text] 
        @validity = Hash.new
        @regex_input.each do |k,v|
            if !v.empty?
                @regex = Regex.find(k.to_s)
                @validity[k] = Regex.check_integrity(@regex.expression,@regex_input[k])
                render :action => 'index'
            end
        end
    end
=end
  
    def show
        id = params[:id] # retrieve regex ID from URI route
        @regex = Regex.find(id) # look up regex by unique ID
        # will render app/views/regexs/show.<extension> by default
        @regex_input = params[:text].nil?? nil: params[:text][:content]
        @validity = Regex.check_integrity(@regex.expression,@regex_input)
        @testcases = Testcase.where(:regex_id => id)
        if params[:commit] == "Add to testcase"
            if @validity == 'No input.'
                #
            elsif @validity == 'No match!'
                flash[:notice] = "Testcase successfully added!"
                Testcase.create(regex_id:@regex.id,content:params[:text][:content],match:'false')
            elsif @validity == 'Matches!'
                flash[:notice] = "Testcase successfully added!"
                Testcase.create(regex_id:@regex.id,content:params[:text][:content],match:'true')
            end
            render :action => 'show'

        end

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
        redirect_to regexes_path(:sort => session[:sort], :tags => r,:text=>params[:text])
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

      @regex_input = []
        
      @regex_input = params[:text].nil?? Hash.new: params[:text] 
      @validity = Hash.new
      @regex_input.each do |k,v|
      if !v.empty?
        @regex = Regex.find(k.to_s)
        @validity[k] = Regex.check_integrity(@regex.expression,@regex_input[k])
      end
    end
    puts params

    end

    def new
        @regex = Regex.new
        @regex.testcases.build
        # @regex.testcases.build
        # @regex.testcases.build
    end

    def create

        # @regex = Regex.create!(regex_params)
        @regex = Regex.new(regex_params)
        if params[:add_testcase]
            # add empty ingredient associated with @recipe
            @regex.testcases.build
        elsif params[:remove_testcase]
            # nested model that have _destroy attribute = 1 automatically deleted by rails
            if @regex.testcases.first.nil?
                @regex.testcases.build
                flash[:notice] = "Must have at least one testcase!"
            end
        else
            # ready to submit, but have to do check first.
            #@regex.save
            #puts @regex.errors.full_messages.to_sentence
            #puts 'error message here'
            #    flash[:notice] = @regex.errors.messages.map { |k,v| v }.join('<br>').html_safe
            # params[:remove_testcase]

            testcase_error_flag = false
            error_msg = []
            if !params[:regex][:testcases_attributes].nil?
                params[:regex][:testcases_attributes].each do |k,v|
                    if !(v[:match].nil? || v[:content].nil?)
                        exp = @regex.expression
                        str = v[:content]
                        expect_res = v[:match] == 'true'? 'Matches!' : 'No match!'
                        if Regex.check_integrity(exp, str) != expect_res
                            #@regex.errors.add(:base, message: "Regex No.#{k} does not behave as expected.")
                            # @regex.errors[:base] <<  "Regex No.#{k} does not behave as expected."
                            error_msg.push("Regex No.#{k.to_i+1} does not behave as expected.")
                            #puts "Regex No.#{k} does not behave as expected."
                            testcase_error_flag = true
                            #puts @regex.errors.messages.map { |k,v| v }.join('<br>')
                        end
                    end
                end
            end
            #puts @regex.errors.messages.map { |k,v| v }.join('<br>')

            if !(@regex.valid? & !testcase_error_flag)
                all_msg = error_msg + @regex.errors.messages.map { |k,v| v }
                flash[:notice] = all_msg.join('<br>').html_safe
            else
                @regex.save
                flash[:notice] = "#{@regex.title} was successfully created."
                # before redirecting to homepage, if we have a new tag, add that to the session to show. (If no session, do not need to add.)
                if (!session[:tags].nil? & !params[:regex][:tag].nil? & !session[:tags].include?(params[:regex][:tag]))
                    session[:tags].push(params[:regex][:tag])
                    # puts session[:tags]
                end
                redirect_to regexes_path and return
            end
        end
        puts params
        render :action => 'new'
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
        params.require(:regex).permit(:title, :expression, :description, :tag, :created_at, testcases_attributes: [:content, :match,:_destroy])
    end
end
