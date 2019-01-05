module RealEstateCompaniesHelper
  def num_realtors real_estate_company
    User.select(:id).where(:real_estate_company_id => real_estate_company.id).count
  end
end
