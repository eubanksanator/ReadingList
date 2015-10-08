class Book < ActiveRecord::Base
   scope :finished, -> { where.not(finished_on: nil) }
   scope :recent,   -> { where('finished_on > ?', 2.days.ago)}
   scope :search, ->(keyword){where(title: keyword) if keyword.present?}

   before_save :set_keywords

   def finished?
      finished_on.present?
   end

   # def self.search(keyword)
   #    if keyword.present?
   #       where(title: keyword)
   #    else
   #       all
   #    end
   # end
end
