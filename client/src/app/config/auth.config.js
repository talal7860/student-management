let $window = window;
// import { CONFIG } from '../config/config';
export function authConfig ($authProvider) {
  'ngInject';
//   $authProvider.configure([
//   { 
//     default: {
//       apiUrl:  'http://localhost:3001',
//       tokenValidationPath:     '/parent-auth/validate_token',
//       signOutUrl:              '/parent-auth/sign_out',
//       accountUpdatePath:       '/parent-auth',
//       confirmationSuccessUrl:  $window.location.href,
//       passwordResetPath:       '/parent-auth/password',
//       passwordUpdatePath:      '/parent-auth/password',
//       passwordResetSuccessUrl: $window.location.href,
//       emailSignInPath:         '/auth/sign_in',
//       storage:                 'cookies',
//       forceValidateToken:      false,
//       validateOnPageLoad:      true,
//       proxyIf:                 function() { return false; },
//       proxyUrl:                '/proxy',
//       omniauthWindowType:      'sameWindow',
//       tokenFormat: {
//         "access-token": "{{ token }}",
//         "token-type":   "Bearer",
//         "client":       "{{ clientId }}",
//         "expiry":       "{{ expiry }}",
//         "uid":          "{{ uid }}"
//       },
//       cookieOps: {
//         path: "/",
//         expires: 9999,
//         expirationUnit: 'days',
//         secure: false,
//         domain: 'domain.com'
//       },
//       createPopup: function(url) {
//         return $window.open(url, '_blank', 'closebuttoncaption=Cancel');
//       },
//       parseExpiry: function(headers) {
//         // convert from UTC ruby (seconds) to UTC js (milliseconds)
//         return (parseInt(headers['expiry']) * 1000) || null;
//       },
//       handleLoginResponse: function(response) {
//         return response.data;
//       },
//       handleAccountUpdateResponse: function(response) {
//         return response.data;
//       },
//       handleTokenValidationResponse: function(response) {
//         return response.data;
//       }
//     }   
//   }, {
//     parent: {
//       apiUrl:                CONFIG.apiUrl,
//       proxyIf:               function() { $window.isOldIE() },
//       signOutUrl:            '/parent-auth/sign_out',
//       emailSignInPath:       '/parent-auth/sign_in',
//       emailRegistrationPath: '/parent-auth',
//       accountUpdatePath:     '/parent-auth',
//       accountDeletePath:     '/parent-auth',
//       passwordResetPath:     '/parent-auth/password',
//       passwordUpdatePath:    '/parent-auth/password',
//       tokenValidationPath:   '/parent-auth/validate_token'
//     }
//   }
// ]);

$authProvider.configure({
  apiUrl:                  'http://localhost:3001',
  tokenValidationPath:     '/auth-parent/validate_token',
  signOutUrl:              '/auth-parent/sign_out',
  emailRegistrationPath:   '/auth-parent',
  accountUpdatePath:       '/auth-parent',
  accountDeletePath:       '/auth-parent',
  confirmationSuccessUrl:  $window.location.href,
  passwordResetPath:       '/auth-parent/password',
  passwordUpdatePath:      '/auth-parent/password',
  passwordResetSuccessUrl: $window.location.href,
  emailSignInPath:         '/auth-parent/sign_in',
  storage:                 'cookies',
  forceValidateToken:      true,
  validateOnPageLoad:      true,
  proxyIf:                 function() { return false; },
  proxyUrl:                '/proxy',
  omniauthWindowType:      'sameWindow',
  authProviderPaths: {
    github:   '/auth-parent/github',
    facebook: '/auth-parent/facebook',
    google:   '/auth-parent/google'
  },
  tokenFormat: {
    "access-token": "{{ token }}",
    "token-type":   "Bearer",
    "client":       "{{ clientId }}",
    "expiry":       "{{ expiry }}",
    "uid":          "{{ uid }}"
  },
  cookieOps: {
    path: "/",
    expires: 9999,
    expirationUnit: 'days',
    secure: false
  },
  createPopup: function(url) {
    return $window.open(url, '_blank', 'closebuttoncaption=Cancel');
  },
  parseExpiry: function(headers) {
    // convert from UTC ruby (seconds) to UTC js (milliseconds)
    return (parseInt(headers['expiry']) * 1000) || null;
  },
  handleLoginResponse: function(response) {
    return response.data;
  },
  handleAccountUpdateResponse: function(response) {
    return response.data;
  },
  handleTokenValidationResponse: function(response) {
    return response.data;
  }
});

}
