class ApplicationFormsController < ApplicationController
    
    def new
        @account = Account.find params[:id]
        @application_form = @account.build_application_form
        render edit
        respond_with(@application_form)
    end
    
    
    
    def edit
        @application_form = ApplicationForm.find(params[:id])
        flash.now[:notice] = "Application form submitted!"
        # to be continued
    end
    
    def create
        @application_form = ApplicationForm.new(application_form_params)
        if @application_form.save
            flash[:notice] = "Application form submitted!"
            redirect_to  edit_application_form_path :id => @application_form.id
        else
            flash.now[:danger] = 'Registration failed, some inforamtion is missing!'
        #render 'new'
        end  
    end
    
    def update
        @application_form = ApplicationForm.find(params[:id])
        #@account.update_attributes!(account_update_params)
        @application_form.attributes = application_form_params
        @application_form.save(:validate => false)
        #redirect_to save_change_path :id => @application_form.id
     #profiles_path
    end
    
    def submit_app
        #@account = Account.find(params[:id])
    end
    
    def application_form_params   
        params.require(:application_form).permit(:interested_areas, :volunteering_status)
    end
    
end
