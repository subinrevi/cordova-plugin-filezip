
import Foundation

@objc(FileZipSwift) class FileZipSwift : CDVPlugin {
    
    /**
     Pass the filename to this method and it will compress and zip the file stored in documents directory and returns the zipped file name.
     **/
    @objc(zipFileWithName:)
    func zipFileWithName(command: CDVInvokedUrlCommand) {
        
        let fileName = command.arguments[0] as? String ?? ""
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )
        
        let fileManagerItem = FileManager()
        let fileExtension = (fileName as NSString).pathExtension
        let documentsUrl =  fileManagerItem.urls(for: .documentDirectory, in: .userDomainMask).first!
        let sourceURL = documentsUrl.appendingPathComponent(fileName)
        let sourceUrlString = sourceURL.path
        let textZipPath = sourceUrlString.replacingOccurrences(of: fileExtension, with: "zip") as String
        let destinationURL = URL(fileURLWithPath: textZipPath)
        
        do {
            
            try fileManagerItem.zipItem(at: sourceURL, to: destinationURL)
        } catch {
            print("Creation of txt ZIP archive failed with error:\(error)")
        }
        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: destinationURL.path)
        
        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
    }
    
    /**
     Pass the filepath to this method and it will compress and zip the file stored in that path and returns the zipped file path.
     **/
    @objc(zipFileAtPath:)
    func zipFileAtPath(command: CDVInvokedUrlCommand) {
        
        let currentWorkingPath = command.arguments[0] as? String ?? ""
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )
        
        let fileManagerItem = FileManager()
        let fileExtension = (currentWorkingPath as NSString).pathExtension
        let sourceURL = URL(fileURLWithPath: currentWorkingPath)
        
        let textZipPath = currentWorkingPath.replacingOccurrences(of: fileExtension, with: "zip")
        let destinationURL = URL(fileURLWithPath: textZipPath)
        
        do {
            
            try fileManagerItem.zipItem(at: sourceURL, to: destinationURL)
        } catch {
            print("Creation of txt ZIP archive failed with error:\(error)")
        }
        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: destinationURL.path)
        
        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
    }
    
    /**
     This method copies a file stored in the app bundle to the documents directory.
     **/
    @objc(copyFile:)
    func copyFile(command: CDVInvokedUrlCommand)
    {
        
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )
        
        let name = command.arguments[0] as? String ?? ""
        let ext = command.arguments[1] as? String ?? ""
        
        if let bundlePath = Bundle.main.path(forResource: name, ofType: ext),
            let destPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                               .userDomainMask,
                                                               true).first {
            
            
            var fileName = ""
            if ext == "" {
                fileName = name
            }else {
                fileName = "\(name).\(ext)"
            }
            
            let fullDestPath = URL(fileURLWithPath: destPath)
                .appendingPathComponent(fileName)
            let fullDestPathString = fullDestPath.path
            print("File Path: \(fullDestPathString)")
            
            if !FileManager.default.fileExists(atPath: fullDestPathString) {
                do {
                    
                    try FileManager.default.copyItem(atPath: bundlePath, toPath: fullDestPathString)
                } catch {
                    print("Error copying file to documents directory :\(error)")
                }
                
            }
            
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: fullDestPathString)
            
            
            self.commandDelegate!.send(
                pluginResult,
                callbackId: command.callbackId
            )
        }
        
        
    }
    
}



