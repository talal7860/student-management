export function routerConfig ($stateProvider, $urlRouterProvider) {
  'ngInject';
  $stateProvider
    .state('base', {
      templateUrl: 'app/views/layout/application.html',
      abstract: true,
      css: './stylesheets/style.css'
    })
    .state('home', {
      url: '/',
      templateUrl: 'app/views/main/main.html',
      controller: 'MainController',
      controllerAs: 'main'
    })
    .state('password_reset', {
      parent: 'base',
      url: '/password-reset',
      templateUrl: 'app/views/password_reset/edit.html',
      controller: 'PasswordResetController',
      controllerAs: 'password_reset'
    })
    .state('login_parent', {
      parent: 'base',
      url: '/login-parent',
      templateUrl: 'app/views/login/login_parent.html',
      controller: 'ParentLoginController',
      controllerAs: 'parent_login'
    });

  $urlRouterProvider.otherwise('/');
}
