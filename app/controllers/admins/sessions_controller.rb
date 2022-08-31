# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  def guest_admin_sign_in
    admin = Admin.guest_admin
    sign_in admin
    redirect_to root_path, notice: "Logged in as guest admin"
  end
end
