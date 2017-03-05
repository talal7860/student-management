export class ParentController {
  constructor (toastr, $auth, Parent, $window, students, $rootScope, $state) {
    'ngInject';
    this.toastr = toastr;
    this.Parent = Parent;
    this.auth = $auth;
    this.$window = $window;
    this.login_params = {
      phone: '',
      password: ''
    }
    $auth.validateUser()
    .then(() => {
        $rootScope.showSideBar = true;
        $rootScope.isLoggedIn = true;
    });
    this.students = students;
    this.$state = $state;
  }

  loginAction() {
    let self = this;
    this.auth.submitLogin(
      self.login_params
    )
    .then((resp) => {
      self.window.location.reload();
      self.toastr.success(resp.email,'Welcome ');
    })
    .catch((resp) => {
      self.toastr.error(resp);
    });
  }
}
