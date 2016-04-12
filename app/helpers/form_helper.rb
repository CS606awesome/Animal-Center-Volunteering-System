module FormHelper
  def setup_account(account)
    account.current_worker ||= CurrentWorker.new
    account.former_criminal ||= FormerCriminal.new
    account.related_councilmember ||= RelatedCouncilmember.new
    account.user_formerworker ||= UserFormerworker.new
    account.accommodation ||= Accommodation.new
    account
  end
  
  def setup_app_account(account)
    account.application_form ||= ApplicationForm.new
    account.criminal_application ||= CriminalApplication.new
    account.student_application ||= StudentApplication.new
    account.minor_application ||= MinorApplication.new
    account
  end
end