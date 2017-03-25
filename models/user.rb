require 'yaml/store' #is this needed here???

class User
  attr_reader :id, :user_name, :password, :editor



  def initialize(id, user_name, password, editor = false) #default to false

    @id = id
    @user_name = user_name
    @password = password
    @editor = editor

  end

  def self.database
    # @database ||= YAML::Store.new "../ideabox"
    @database ||= YAML::Store.new "ideabox"
  end



  # Notice that the old instance method database now just calls Idea.database.
  # The result is that, in either an instance method or class method, we can
  # now call database to get our database:


  def database
    User.database
  end




  def save
    database.transaction do |db|

      db['users'] ||= []
      db['users'] << {id: id, user_name: user_name, password: password, editor: editor}
    end
  end

end



#authentication class should be separate
#separate issue

#create = check if user exists, if not create
#login method = accessing site once user exists (go to db + get info)
  #add cookie to user's browser
  #create session

#when initializes, boolean true/false editor
#in the database
#one page if editor, one page if not
#flag to frontend
#if true show this button is in the view or render different view

#method that will check password

#https://www.safaribooksonline.com/library/view/head-first-ruby/9781449372644/ch15.html
#UNIQUE IDENTIFIER

# you can also add position to view
# Adding the Position to the View
#
# In the view we can get the position, or index, by changing the ideas.each loop to be an ideas.each_with_index loop

