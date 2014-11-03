
User.create(:id=> 100000, :username => "administrator", :active => true, admin: true, email: "theoneomega@gmail.com", password: "Password1", password_confirmation: "Password1")

RolesUi::Role.create(:name => "viewer")
#Assignment.create(user_id: User.find_by_username("sir.newtoon").id, role_id: Role.find_by_name("viewer").id)
Permission.create(role_id: Role.find_by_name("viewer").id, name: "index", resource: "User", cannot: false)
Permission.create(role_id: Role.find_by_name("viewer").id, name: "show", resource: "User", cannot: false, condition: "if_current_user_true")
#User.find_by_username("sir.newtoon").roles << Role.find_by_name("viewer")




