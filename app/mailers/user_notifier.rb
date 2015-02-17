class UserNotifier < ApplicationMailer
  default :from => 'q_answer@example.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_question_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Question in Q-Answers' )
  end

end
