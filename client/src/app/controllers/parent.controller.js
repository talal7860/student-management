export class ParentController {
  constructor (action) {
    'ngInject';
    switch(action) {
      case 'login':
        self.loginAction();
      break;
    }
  }

  loginAction() {
    this.login_params = {
      email: '',
      password: ''
    }
  }
}
