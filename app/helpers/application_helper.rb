module ApplicationHelper

  def has_role?(role)
    current_account && current_account.has_role?(role)
  end

   def gravatar_for(account, options = { size: 200})
    gravatar_id = Digest::MD5::hexdigest(account.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: account.name, class: "border-radius-50")
  end

end


