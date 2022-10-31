class Regex < ActiveRecord::Base

    def self.parse_tag(tags)

    end

    def self.check_integrity(exp, str)
        reg = Regexp.new exp
        if str == '' or str.nil?
            return "No input."
        else
            res = str =~ reg
            res.nil?? "No match!": "First match at index #{res}."
        end
    end

end
