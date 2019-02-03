RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

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

  config.model "Story" do
    list do
      field :id
      field :media do
        sortable false
        filterable false
        pretty_value do
          if bindings[:object].media.present?
            ActiveStorage::Current.set(host: "http://localhost:3000") do
              bindings[:view].tag(:img, {:src => bindings[:object].media.representation(resize: "200x200>").processed.service_url})
            end
          end
        end
      end
      field :name
      field :description
      field :created_at
      field :updated_at
    end

    show do
      field :id
      field :media do
        pretty_value do
          if bindings[:object].media.present?
            ActiveStorage::Current.set(host: "http://localhost:3000") do
              bindings[:view].tag(:img, {:src => bindings[:object].media.representation(resize: "200x200>").processed.service_url})
            end
          end
        end
      end
      field :name
      field :description
      field :created_at
      field :updated_at
    end
  end
end
