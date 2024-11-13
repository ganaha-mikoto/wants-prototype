class Users::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super
  end

  protected

  def auth_options
    { scope: :user, recall: "#{controller_path}#new" }
  end

  # ログイン失敗時のメッセージをカスタマイズ
  def failure_message
    I18n.t("devise.failure.invalid")
  end
end 