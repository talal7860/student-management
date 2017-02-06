export class ParentController {
  constructor (action, toastr) {
    'ngInject';
    this.toastr = toastr;
    this.login_params = {
      email: '',
      password: ''
    }
    switch(action) {
      case 'login':
        this.loginAction();
      break;
    }
  }

  loginAction() {
    if (this.login_params.email == "usama.lhr@gmail.com") {
      this.toastr.success('annay wa')
    }
  }
}
