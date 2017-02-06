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
    .state('parent', {
      parent: 'base',
      abstract: true,
      template: '<ui-view />'
    })
    .state('parent.login', {
      parent: 'parent',
      url: '/parent/login',
      controller: 'ParentController',
      controllerAs: 'parent',
      templateUrl: 'app/views/parent/login.html',
      resolve: {
        action: () => {
          return 'login';
        }
      }
    });

  $urlRouterProvider.otherwise('/');
}
