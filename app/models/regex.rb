class Regex < ActiveRecord::Base
    has_many :testcases
    has_many :likes
    accepts_nested_attributes_for :testcases, :allow_destroy => true

    validates :title, presence: { message: "Regex must have name!" }
    validates :expression, presence: { message: "Regex must have expression!" }
    # validates :expression, presence: true
    # validates_associated :testcases


    def self.parse_tag(tags)

    end

    def self.all_pass(exp, testcases)
    end

    def self.check_integrity(exp, str)
        reg = Regexp.new exp
        if str == '' or str.nil?
            return "No input."
        else
            res = str =~ reg
            res.nil?? "No match!": "Matches!"
            ## "First match at index #{res}."
            # res=str.match(reg)
            # if res
            #     res=res[0]
            #     if res == str
            #         return  "Matches!"
            #     else
            #         return  "No match!"
            #     end
            # else
            #     return  "No match!"
            # end
        end
    end

# functions for filter
    # def self.tags
    #   pluck(:tag).uniq
    # end

    # def self.find_all_by_tags(tags, ordering)
    #   self.where(tag: tags).order(ordering)
    # end

    def self.all_tags
      # all_tags = self.select(:tag).map(&:tag).uniq.reject(&:empty?)
      # puts 'here tags'
      # puts self.select(:tag).map(&:tag).map { |tag| tag.split(',').map(&:strip) }
      all_tags = self.select(:tag).map(&:tag).map { |tag| tag.split(',').map(&:strip)}.flatten.uniq.reject(&:empty?)
    end

    # def self.with_tags(tag)
    #   if tag.nil?
    #     return self.where(tag: self.all_tags)
    #   else
    #     return self.where(tag: tag.reject(&:empty?))
    #   end
    # end

    def self.with_tags(tag)
=begin
      # return self.where(tag: tag.reject(&:empty?))
      tags = tag.map {|i| i.split(",").map(&:strip)}
      # tags = tags.flatten.join("|")
      tags = tags.flatten.join("%' OR tag LIKE '%")
      puts "tag here!!!"
      puts tag
      return ActiveRecord::Base.connection.execute("SELECT * FROM regexes WHERE tag like '%" + tags + "%'")
      # return self.where("tag ~ ?",tags)
      #return self.where('name like ?', tag)
=end
      tags = tag.map {|i| i.split(",").map(&:strip).reject(&:empty?)}
      tags = tags.flatten
      all_regexes = ActiveRecord::Base.connection.execute("SELECT * FROM regexes")
      ret = []
      all.each do |regex|
        current_tag = regex["tag"].split(",").map(&:strip).reject(&:empty?)
        if !(current_tag & tags).empty? # if they have intersection
            ret.push(regex)
        end
      end
      ret 
    end

end
