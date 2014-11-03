class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'Usted no tiene permiso para realizar esta acción.'
    redirect_to root_url
  end
  before_filter :get_data



  def get_data

    if signed_in?
      norte = User.where(:area => 'NORTE')
      centro = User.where(:area => 'CENTRO')
      sur = User.where(:area => 'SUR')
      occidente = User.where(:area => 'OCCIDENTE')
      @analyst_list = User.where(:id => 0)
      if can? :supervisar_norte, User
        @analyst_list = @analyst_list+norte
      end
      if can? :supervisar_sur, User
        @analyst_list = @analyst_list+sur
      end
      if can? :supervisar_centro, User
        @analyst_list = @analyst_list+centro
      end
      if can? :supervisar_occidente, User
        @analyst_list = @analyst_list+occidente
      end

      @priorities =[]
    end


  end

  def get_login_type
    if signed_in?
      @current_user = current_user
      @is_user = current_user.blank? ? true : false
    end
  end
end
