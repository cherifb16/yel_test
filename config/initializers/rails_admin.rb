RailsAdmin.config do |config|
  config.asset_source = :webpacker

  ### Popular gems integration

  config.authorize_with do |controller|
    if current_user.nil? && !admin_signed_in? && !partner_signed_in?
      redirect_to main_app.user_session_path, flash: {error: 'Please Login to Continue..'}
    elsif !admin_signed_in?
      redirect_to main_app.root_path, flash: {error: 'You are not Admin bro!'}
    end
  end
  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
