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

    def self.tags
      pluck(:tag).uniq
    end

    def self.find_all_by_tags(tags, ordering)
      self.where(tag: tags).order(ordering)
    end

    def self.all_tags
      ['time', 'username', 'email', 'number']
    end

    def self.with_tags(tag)
      if tag.nil?
        return self.where(tag: self.all_tags)
      else
        return self.where(tag: tag)
      end
    end

end
