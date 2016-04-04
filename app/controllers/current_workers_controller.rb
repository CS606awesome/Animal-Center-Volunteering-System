class CurrentWorkersController < ApplicationController
    def new 
        @account = Account.find params[:id]
        @current_worker = @account.build_current_worker
        respond_with(@current_worker)
    end
    
    def create
        @account = Account.find params[:id]
        @current_worker = @account.build_current_worker(params[:current_worker])
        #redirect_to account_path(@account)
    end
    
    private
       def current_worker_params
           params.require(:current_worker).permit(:department, :name)
       end
end
