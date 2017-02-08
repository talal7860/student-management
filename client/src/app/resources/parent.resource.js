export function ParentResourceFactory($resource, $auth)
{
  'ngInject';
   return $resource('/api/parents/:action', null,
      {
        'resetPassword' : { method: 'POST', params: {
            action : 'reset_password'
          }
        },
        'validateParentResetPasswordToken' : { method: 'POST', params: {
            action : 'validate_reset_password_token'
          }
        },
        'loginAction' : { method: 'POST', params: {
            action : 'login_action'
          }
        },
        'students' : { method: 'GET', isArray: true, params: {
            action : 'students'
          }, headers: $auth.retrieveData('auth_headers')
        }
      }
   );
}
