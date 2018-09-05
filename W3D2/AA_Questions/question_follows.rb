require_relative 'questions.rb'
require_relative 'user.rb'

class QuestionFollows
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map {|datum| QuestionFollows.new(datum)}
  end
  
  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
  
  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @question_id, @user_id)
      INSERT INTO
        question_follows (question_id, user_id)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def self.followers_for_question_id(question_id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM 
        users 
      JOIN question_follows ON users.id = question_follows.user_id
      WHERE 
        question_id = ?
    SQL
    
    followers = []
    follow.each do |fol|
      followers << User.new(fol)
    end
    
    followers 
  end
  
end