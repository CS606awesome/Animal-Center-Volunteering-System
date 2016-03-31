module FormHelper
  def setup_account(account)
    account.current_worker ||= CurrentWorker.new
    account.former_criminal ||= FormerCriminal.new
    account.related_councilmember ||= RelatedCouncilmember.new
    account.user_formerworker ||= UserFormerworker.new
    account.accommodation ||= Accommodation.new
    account
  end
end