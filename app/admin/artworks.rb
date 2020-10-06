ActiveAdmin.register Artwork do

  filter :price
  filter :created_at
  filter :sold

  form do |f|
     f.inputs "Artwork Information" do
       f.input :name
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

   permit_params :name, :price, :dimensions, :material, :sold, photos: []

end
