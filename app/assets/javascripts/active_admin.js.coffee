#= require active_admin/base
#= require vendor/jquery.mask.js
$(document).ready ->
  $('#user_cnic').mask '00000-0000000-0'
  $('#user_phone').mask '+92-000-0000000'
  return