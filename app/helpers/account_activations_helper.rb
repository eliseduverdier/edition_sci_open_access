module AccountActivationsHelper

  def get_activation_link(person)
    # "#{_?_app_base_url_?_}/account_activations/#{person.activation_token}/edit?email=#{person.email}"
    edit_account_activation_url(person.activation_token, email: person.email)
  end

end
