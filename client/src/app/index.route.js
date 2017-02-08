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
      controllerAs: 'main',
      resolve: {
        students: ((Parent, $auth, $state) => {
          $auth.validateUser()
          .then(() => {
            $state.go('parent.students');
          })
          .catch(() => {
            $state.go('parent.login');
          })
        })
      }
    })
    .state('parent', {
      parent: 'base',
      abstract: true,
      template: '<ui-view />'
    })
    .state('parent.password_reset', {
      parent: 'parent',
      url: '/parent/password-reset',
      templateUrl: 'app/views/parent/password_reset.html',
      controller: 'PasswordResetController',
      controllerAs: 'password_reset'
    })
    .state('parent.login', {
      parent: 'parent',
      url: '/parent/login',
      controller: 'ParentController',
      controllerAs: 'parent',
      templateUrl: 'app/views/parent/login.html',
      resolve: {
        students: ((Parent, $auth, $state) => {
          $auth.validateUser()
          .then(() => {
            $state.go('parent.students');
          })
          .catch(() => {
          })
        })
      }
    })
    .state('parent.students',{
      parent: 'parent',
      url: '/parent/students',
      templateUrl: 'app/views/parent/students.html',
      controller: 'ParentController',
      controllerAs: 'parent',
      resolve: {
        students: ((Parent, $auth, $state) => {
          return $auth.validateUser()
          .then(() => {
            return Parent.students().$promise
          })
          .catch(() => {
            $state.go('parent.login');
          })
        })
      }
    })

  $urlRouterProvider.otherwise('/');
}
