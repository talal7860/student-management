/* global malarkey:false, moment:false */

import { config } from './index.config';
import { authConfig } from './config/auth.config';
import { routerConfig } from './index.route';
import { runBlock } from './index.run';
import { MainController } from './controllers/main.controller';
import { PasswordResetController } from './controllers/password_reset.controller';
import { ParentLoginController } from './controllers/password_reset.controller';
import { GithubContributorService } from '../app/components/githubContributor/githubContributor.service';
import { WebDevTecService } from '../app/components/webDevTec/webDevTec.service';

import { NavbarDirective } from '../app/components/navbar/navbar.directive';
import { MalarkeyDirective } from '../app/components/malarkey/malarkey.directive';

import { ParentResourceFactory } from './resources/parent.resource';

angular.module('client', ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngMessages', 'ngAria', 'ngResource', 'ui.router', 'ui.bootstrap', 'toastr', 'ng-token-auth', 'blockUI'])
  .constant('malarkey', malarkey)
  .constant('moment', moment)
  .config(config)
  .config(routerConfig)
  .config(authConfig)
  .run(runBlock)
  .service('githubContributor', GithubContributorService)
  .service('webDevTec', WebDevTecService)
  .controller('MainController', MainController)
  .controller('PasswordResetController', PasswordResetController)
  .factory('Parent', ParentResourceFactory)
