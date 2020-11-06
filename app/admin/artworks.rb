ActiveAdmin.register Artwork do

  filter :price
  filter :sold

  index do
    selectable_column
    column :name
    column :price
    column :dimensions
    column :material
    column "Weight (in kg)", :weight
    column :sold
  end

  form do |f|
     f.inputs "Artwork Information" do
       f.input :name
       f.input :price
       f.input :dimensions
       f.input :weight, label: "Weight (in kg)"
       f.input :material
       f.input :sold
     end

     f.inputs "Photos" do
       f.input :photos, as: :file, input_html: { multiple: true }
     end
     f.actions
   end

   permit_params :name, :price, :dimensions, :weight, :material, :sold, photos: []

end
