class Regex < ActiveRecord::Base

    def self.parse_tag(tags)

    end

    def self.check_integrity(exp, str)
        reg = Regexp.new exp
        if str == '' or str.nil?
            return "No input."
        else
            ##            res = str =~ reg
            ##            res.nil?? "No match!": "First match at index #{res}."
            res=str.match(reg)
            if res
                res=res[0]
                if res == str
                    return  "#{ res } true"
                else
                    return  "#{ res } false"
                end
            else
                return  false
            end
        end    
    end
end    