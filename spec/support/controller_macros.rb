module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"]= Devise.mappings[:user]
      @user = User.create(
        email: 't@t.com',
        password: '111111',
        first_name: 'Testy',
        last_name: 'Testerson',
        age: 21,
        user_name: 'BodyDump'
      )

      sign_in @user
    end
  end
end
