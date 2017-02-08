export class PasswordResetController {
  constructor (toastr, $auth, Parent, $location, $rootScope) {
    'ngInject';

    this.toastr = toastr;
    this.Parent = Parent;
    this.params = {
      password: '',
      password_confirmation: '',
      reset_password_token: $location.search()["password_reset_token"]
    };
    if ($auth.user) {
      $rootScope.showSideBar = false;
    }
    this.validateToken();
  }

  validateToken() {
    this.Parent.validateParentResetPasswordToken({
      reset_password_token: this.params.reset_password_token
    }).$promise
    .then(() => {
      this.isTokenValid = true;
    })
    .catch(() => {
      this.isTokenValid = false;
    });
  }

  resetPassword() {
    if (this.params.password !== this.params.password_confirmation) {
      this.toastr.error('Passwords do not match')
    }
    else if (this.params.password.length < 8 || this.params.password_confirmation.length < 8) {
      this.toastr.error('Password length less than 8')
    }
    else {
      this.Parent.resetPassword(this.params).$promise
      .then(() => {
      })
      .catch(() => {
      });
  
    }
  }
}
