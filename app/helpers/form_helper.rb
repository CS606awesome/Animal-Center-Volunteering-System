module FormHelper
  def setup_account(account)
    account.current_worker ||= CurrentWorker.new
    account
  end
end