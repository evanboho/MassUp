class Devise::OmniauthCallbacksController < DeviseController

  def facebook
    build_or_find_auth
    session[:logged_in_through] = "facebook"
    sign_in_and_redirect(@user) if !current_user
  end
  
  def google_oauth2
    build_or_find_auth
    session[:logged_in_through] = "google"
    sign_in_and_redirect(@user) if !current_user
  end

  def twitter
    build_or_find_auth
    if @user.present?
      session[:logged_in_through] = "twitter"
      sign_in_and_redirect(@user) 
    else
      session[:twitter] = auth_hash
    end
  end

  def twitter_with_email
    build_or_find_auth(twitter_hash)
    # render :text => @user.to_yaml
    sign_in_and_redirect(@user) 
  end
  
  def build_or_find_auth(auth = nil)
    auth ||= auth_hash
    if current_user
      current_user.authentications.find_or_create(auth, current_user)
    elsif authentication = Authentication.find_by_provider_and_uid(auth[:provider], auth[:uid])
      authentication.save
      return @user = User.find(authentication.user_id)
    elsif @user = User.find_or_create(auth)
      @user.authentications.find_or_create(auth, @user)
      return @user
    else
      return nil   
    end
  end 
  
  def auth_hash
    a = request.env['omniauth.auth']
    { :name => a.info.name, :email => a.info.email, :uid => a.uid, 
      :provider => a.provider, :username => a.info.nickname, :photo_url => a.info.image }
  end
  
  def twitter_hash
    { :name => session[:twitter][:name], :email => params[:email], :uid => session[:twitter][:uid],
      :provider => session[:twitter][:provider], :username => session[:twitter][:username], :photo_url => session[:twitter][:photo_url] }
  end
  
  def failure
    set_flash_message :alert, :failure, :kind => failed_strategy.name.to_s.humanize, :reason => failure_message
    redirect_to after_omniauth_failure_path_for(resource_name)
  end

  protected

  def failed_strategy
    env["omniauth.error.strategy"]
  end

  def failure_message
    exception = env["omniauth.error"]
    error   = exception.error_reason if exception.respond_to?(:error_reason)
    error ||= exception.error        if exception.respond_to?(:error)
    error ||= env["omniauth.error.type"].to_s
    error.to_s.humanize if error
  end

  def after_omniauth_failure_path_for(scope)
    new_session_path(scope)
  end

end