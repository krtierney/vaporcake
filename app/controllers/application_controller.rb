class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user_logged_in_state_to_false, if: :devise_controller?, only: [:destroy]
  before_action :set_user_logged_in_state_to_true, if: :devise_controller?, only: [:create]

  helper_method :markdown
  protected

    def markdown(text)
      options = {
        filter_html:     true,
        hard_wrap:       true, 
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true, 
        no_images:        true

      }

      extensions = {
        autolink:           true,
        superscript:        true,
        lax_spacing:        true,
        disable_indented_code_blocks: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      markdown.render(text).html_safe
    end

    def require_admin
      unless current_user.is_admin
        redirect_to root_path, alert: "You do not have administrative access."
      end        
    end
    helper_method :require_admin

    def configure_permitted_parameters      
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :user_image])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :user_image])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:logged_in])
    end

    def after_sign_in_path_for(resource)
      new_question_path
    end

    def after_sign_out_path_for(resource)
      root_path
    end

    #Doesn't work-- check later?
    def after_update_path_for(resource)
      user_path(current_user)
    end

    def set_user_logged_in_state_to_true
      session[:timestamp] = Time.now.utc
      current_user.update(logged_in: true) if current_user
    end

    def set_user_logged_in_state_to_false
      current_user.update(logged_in: false) if current_user
    end
end
