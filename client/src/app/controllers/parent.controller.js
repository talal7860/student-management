export class ParentController {
  constructor (toastr, $auth, Parent, $window) {
    'ngInject';
    this.toastr = toastr;
    this.Parent = Parent;
    this.auth = $auth;
    this.$window = $window;
    this.login_params = {
      email: '',
      password: ''
    }
  }

  loginAction() {
    let self = this;
    this.auth.submitLogin(
      this.login_params
    )
    .then((resp) => {
      self.toastr.success(resp.email,'Welcome ');
      self.$window.location.href = '#/parent/students';
    })
    .catch((resp) => {
      self.toastr.error(resp);
    });
  }
}
