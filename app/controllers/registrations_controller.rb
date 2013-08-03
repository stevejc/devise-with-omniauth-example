class RegistrationsController < Devise::RegistrationsController
  def edit
    @authentications = current_user.authentications if current_user
    super
  end
  
  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
  
end
