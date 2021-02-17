class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation, :kana, :address, :phone_number, :line_id, :payee, :score ] # deviseで登録するために追加している
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def after_sign_in_path_for(resource) #deviseでログイン後のリダイレクト先を指定
    case resource
    when Admin
      if current_admin.present?
        admin_account_admin_path(resource)
      else
        flash[:danger] = "ログインしてください"
        root_path(resource)
      end
    when User
      if current_user.present?
        user_account_user_path(resource)
      else
        flash[:danger] = "ログインしてください"
        root_path(resource)
      end
    when Owner
      if current_owner.present?
        owner_account_owner_path(resource)
      else
        flash[:danger] = "ログインしてください"
        root_path(resource)
      end
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # current_userのサブスクプラン支払い詳細
  def payment_check
    @pay = current_user.customer_id
    if @pay.present?
      @payment = Stripe::Checkout::Session.retrieve(@pay)
      @sub_now = Stripe::Subscription.retrieve(@payment.subscription)
    end
  end

  # ログイン中のユーザーが何かしらのプランに加入していた場合支払いを停止する
  def payment_planning_delete
    if current_user.customer_id.present?
      @payment = Stripe::Checkout::Session.retrieve(current_user.customer_id)
      Stripe::Subscription.delete(@payment.subscription)
      current_user.update!(customer_id: "")
    end
  end
end
