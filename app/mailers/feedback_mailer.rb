class FeedbackMailer < ActionMailer::Base
  default :from => 'noreply@yoursite.com'

  def feedback(feedback)
    @feedback = feedback
    mail(:to => 'mtl858@gmail.com', :subject => '[Feedback for YourSite] #{feedback.subject}')
  end
end
