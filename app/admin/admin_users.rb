ActiveAdmin.register AdminUser do
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
  
  index do |f|
    f.column :id
    f.column :email
    f.column :last_sign_in_at
    f.column :last_sign_in_ip
    default_actions
  end
  
end
