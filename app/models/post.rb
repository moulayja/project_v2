class Post < ActiveRecord::Base
   has_many :comments, dependent: :destroy
   belongs_to :category
 
   validates_presence_of :title, :content,
                         :minimum => 8 

end
