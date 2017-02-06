export function ParentResourceFactory($resource)
{
  'ngInject';
   return $resource('/api/parents/:action', null,
      {
        'validate' : { method: 'POST', params: {
            action : 'validate'
          }
        },
        'new' : { method: 'GET', params: {
            action: 'new'
          }
        },
        'find_by_email' : { method: 'POST', params: {
            action : 'find_by_email'
          }
        },
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
        }
      }
   );
}
