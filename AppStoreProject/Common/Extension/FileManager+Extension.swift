//
//  FileManager+Extension.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/11/19.
//

import Foundation


extension FileManager {
    

    func saveDocument(data:Data, savePath:String, completion: ((Error?) -> Void)? = nil) {
        guard let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else { return }
        
        var filePath = URL(fileURLWithPath: path)
        filePath.appendPathComponent(savePath as String)
        
        print(filePath.path)
        
        do {
            try data.write(to: filePath)
        } catch {
            completion!(error)
        }
    }
    

    
    
}
