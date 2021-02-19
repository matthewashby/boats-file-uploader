class ApplicationController < ActionController::Base
  # before_action :set_raven_context

  # def set_raven_context
  #   return if Rails.env.development? || Rails.env.test?

  #   Raven.user_context(id: session[:current_user_id])
  #   Raven.extra_context(params: params.to_unsafe_h, order_id: @order&.id, url: request.url)
  # end
end
