require_relative 'questions.rb'

class Question 
  attr_accessor :title, :body, :user_id
  
  def self.all 
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map {|datum| Question.new(datum)} 
  end
  
  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        questions
      WHERE
        id = ?    
    SQL
    return nil unless question.length > 0
    
    Question.new(question.first)
  end
  
  def self.find_by_user_id(user_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM 
        questions
      WHERE
        user_id = ?    
    SQL
    return nil unless question.length > 0
    
    user_questions = []
    
    question.each do |ques|
      user_questions << Question.new(ques)
    end
    
    user_questions
  end
  
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end
  
  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
      INSERT INTO
        questions (title, body, user_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def update
    raise "#{self} not in database" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
      UPDATE
        questions
      SET
        title = ?, body = ?, user_id = ?
      WHERE
        id = ?
    SQL
  end
  
  def author 
    User.find_by_id(@user_id)
  end
  
  def replies 
    Reply.find_by_user_id(@user_id)
  end
end