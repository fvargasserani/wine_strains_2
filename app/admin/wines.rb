ActiveAdmin.register Wine do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :year
  #
  # or
  #
   permit_params do
     permitted = [:name, wine_strains_attributes: [:id, :wine_id, :strain_id, :percentage]]
     permitted << :other if params[:action] == 'create' && current_user.admin?
     permitted
   end
  
end
