class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    edit_user_registration_path resource
  end

  def after_update_path_for(resource)
    edit_user_registration_path resource
  end

  private

  def update_resource(resource, params)
    return super if params['password']&.present?
    resource.update_without_password(params.except('current_password'))
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :realtor, :house_hunter)
  end

  def account_update_params
    params.require(:user)
      .permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :current_password,
        :phone,
        :preferred_method,
        :house_hunter,
        :realtor,
        :real_estate_company_id)
  end
end
