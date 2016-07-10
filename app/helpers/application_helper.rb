module ApplicationHelper
    require 'rest-client'
    require 'json'
    require 'date'
    @quote_of_the_day = nil
    def gravatar_for (user, options = {size: 80})
        gravatar_id = Digest::MD5::hexdigest(user.email)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "img-circle")
    end

    def get_quote_of_the_day
      if @quote_of_the_day && Date.parse(@quote_of_the_day[:date]) == Date.today
        @quote_of_the_day
      else
        response = RestClient.get "http://quotes.rest/qod.json"
        @quote_of_the_day = JSON.parse(response,symbolize_names: true)[:contents][:quotes].first
      end
    end
end
