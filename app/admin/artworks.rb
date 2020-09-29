ActiveAdmin.register Artwork do

  filter :price
  filter :created_at
  filter :sold

  form do |f|
     f.inputs "Artwork Information" do
       f.input :name
       f.input :description
       f.input :price
       f.input :dimensions
       f.input :material
       f.input :sold
     end

     f.inputs "Photos" do
       f.input :photos, as: :file, input_html: { multiple: true }
     end
     f.actions
   end

   permit_params :name, :description, :price, :dimensions, :material, :sold, photos: []

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :sold, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
