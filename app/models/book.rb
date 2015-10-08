class Book < ActiveRecord::Base
   belongs_to :genre

   scope :finished, -> { where.not(finished_on: nil) }
   scope :recent,   -> { where('finished_on > ?', 2.days.ago)}
   scope :search, ->(keyword){ where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present?}


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


   protected #this can NOT be access from anywhere else
   # Takes this Book objects values for title, author and description, downcase it all into new array then join it all in on big text
      def set_keywords
         self.keywords = [title, author, description].map(&:downcase).join(' ')
      end
end
