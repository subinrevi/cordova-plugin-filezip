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

The above function zips the file at the given path and returns the zipped file path. A sample function call to demonstrate the usage is given below.

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
 
 ```
 exports.zipFileWithName = function(arg0, success, error) {
exec(success, error, 'FileZipSwift', 'zipFileWithName', [arg0]);
};

 ```
 
The above functions zips the file the given name (parameter) inside the documents directory and returns the zipped file name.A sample function call to demonstrate the usage is given below.

```
filezip.zipFileWithName(fileName,
                                function(msg) {
                                console.log(msg);
                                },
                                function(err) {
                                console.log(err);
                                }
                                );
```
 
 #### filezip.copyFile
 
This function copies a file from the application bundle to the documents directory. The file name and file extension needs to passed to the function.

```
exports.copyFile = function(arg0,arg1, success, error) {
  exec(success, error, 'FileZipSwift', 'copyFile', [arg0,arg1]);
};
```
                            
     
     
