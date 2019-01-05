module HousesHelper
  def add_to_list_visible?(house)
    house_hunter_logged? || admin_logged?
  end

  def edit_visible?(house)
    (current_user.id == house.realtor_id) || admin_logged?
  end

  def potential_buyers_visible?(house)
    (house.realtor.id == current_user.id) || admin_logged?
  end

  def is_potential_buyer?(house, user)
    house.potential_buyers.include? user
  end
end
