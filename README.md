# cordova-plugin-filezip
A Cordova plugin for zipping files. (iOS only)

This plugin can be used for zipping files stored inside Cordova applications. Also you can copy files from your application bundle to documents directory.


## Methods

#### filezip.zipFileAtPath

```
exports.zipFileAtPath = function(arg0, success, error) {
exec(success, error, 'FileZipSwift', 'zipFileAtPath', [arg0]);
};
```

The above function zips the file at the given path. A sample function call to demonstrate the usage is given below

```
filezip.zipFileAtPath(filePath,
                            function(msg) {
                            console.log(msg);
                            
                            },
                            function(err) {
                            console.log(err);
                            }
                            );
     ```
     
     
     #### filezip.zipFileWithName
     
     
