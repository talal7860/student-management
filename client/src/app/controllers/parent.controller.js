export class ParentController {
  constructor (toastr, $auth, Parent, $window, students, $rootScope) {
    'ngInject';
    this.toastr = toastr;
    this.Parent = Parent;
    this.auth = $auth;
    this.$window = $window;
    this.login_params = {
      email: '',
      password: ''
    }
    $auth.validateUser()
    .then(() => {
        $rootScope.showSideBar = true;
        $rootScope.isLoggedIn = true;
    });
    this.students = students;
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
