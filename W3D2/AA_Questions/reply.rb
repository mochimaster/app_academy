require_relative 'questions.rb'

class Reply
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map {|datum| Reply.new(datum)}
  end
  
  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT 
        *
      FROM
        replies
      WHERE 
        id = ?
    SQL
    return nil unless reply.length > 0 
    
    Reply.new(reply.first)
  end
  
  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL,question_id)
      SELECT 
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    
  end
  
  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT 
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    user_replies = []
    
    reply.each do |repl|
      user_replies << Question.new(repl)
    end
    user_replies
  end
  
  def self.find_by_reply_id(reply_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL,reply_id)
      SELECT
        * 
      FROM
        replies
      WHERE
        reply_id = ?    
    SQL
    
    child_replies = []
    
    reply.each do |repl|
      child_replies << Reply.new(repl)
    end
    child_replies
  end
  
  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @body = options['body']
    @reply_id = options['reply_id']
  end
  
  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @question_id, @user_id, @body, @reply_id)
      INSERT INTO
        replies (question_id, user_id, body, reply_id)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end
  
  def author 
    User.find_by_id(@user_id)
  end 
  
  def question 
    Question.find_by_id(@question_id)
  end
  
  def parent_reply
    Reply.find_by_id(@reply_id)
  end
  
  def child_replies
    Reply.find_by_reply_id(@id)
  end
  
end