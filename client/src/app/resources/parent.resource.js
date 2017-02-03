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
        'validateResetPasswordToken' : { method: 'POST', params: {
            action : 'validate_reset_password_token'
          }
        }
      }
   );
}
