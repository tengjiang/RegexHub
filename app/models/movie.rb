# class Movie < ActiveRecord::Base
#
#   def self.ratings
#     pluck(:rating).uniq
#   end
#
#   def self.find_all_by_ratings(ratings, ordering)
#
#     self.where(rating: ratings).order(ordering)
#
#   end
#
#   def self.all_ratings
#     ['G','PG','PG-13','R']
#   end
#
#   def self.with_ratings(rating)
#     if rating.nil?
#       return self.where(rating: self.all_ratings)
#     else
#       #return self.where(rating: rating.keys.map!(&:upcase))
#       return self.where(rating: rating)
#     end
#   end
#
#   def self.find_movies_with_same_director movie_id
#     movie = Movie.find(movie_id)
#     Movie.where("director = ?", movie.director)
#   end
# end
