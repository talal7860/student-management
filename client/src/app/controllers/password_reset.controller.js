export class PasswordResetController {
  constructor (toastr, $auth, Parent, $location) {
    'ngInject';

    this.toastr = toastr;
    this.Parent = Parent;
    this.params = {
      password: '',
      password_confirmation: '',
      reset_password_token: $location.search()["password_reset_token"]
    };
    this.validateToken();
  }

  validateToken() {
    this.Parent.validateResetPasswordToken({reset_password_token: this.params.reset_password_token}).$promise
    .then((res) => {
      this.isTokenValid = true;
    })
    .catch((res) => {
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
      .then((res) => {
      })
      .catch((res) => {
      });
  
    }
  }
}
