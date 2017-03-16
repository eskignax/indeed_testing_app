class LoginPage
  include PageObject

  element :login_without_account, 'android.view.View', id: 'appSignInDismiss'

  def login_guest
    login_without_account_element.when_present.click
  end

end
