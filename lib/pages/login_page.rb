class LoginPage
  include PageObject

  element :login_without_account, 'android.view.View', id: 'appSignInDismiss'
  button :create_account, id: 'appSignInCreate'

  def login_guest
    login_without_account_element.wait_until_present.click
  end

end
