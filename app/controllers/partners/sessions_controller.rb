# frozen_string_literal: true

class Partners::SessionsController < Devise::SessionsController
  def guest_partner_sign_in
    partner = Partner.guest_partner
    sign_in partner
    redirect_to root_path, notice: "Logged in as guest partner"
  end
end
