/**
 *
 * Created by Subin Revi on 31/01/2019.
 * https://github.com/subinrevi
 * MIT-Licensed
 *
 */

var exec = require('cordova/exec');

exports.copyFile = function(arg0,arg1, success, error) {
  exec(success, error, 'FileZipSwift', 'copyFile', [arg0,arg1]);
};
             
exports.zipFileAtPath = function(arg0, success, error) {
exec(success, error, 'FileZipSwift', 'zipFileAtPath', [arg0]);
};
               
exports.zipFileWithName = function(arg0, success, error) {
exec(success, error, 'FileZipSwift', 'zipFileWithName', [arg0]);
};
