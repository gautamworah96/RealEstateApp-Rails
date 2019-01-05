module ApplicationHelper
  def house_hunter_logged?
    user_signed_in? && current_user.house_hunter
  end

  def realtor_logged?
    user_signed_in? && current_user.realtor
  end

  def admin_logged?
    user_signed_in? && current_user.admin
  end

  def can_add_new_house?
    realtor_logged? && current_user.real_estate_company_id
  end
end
