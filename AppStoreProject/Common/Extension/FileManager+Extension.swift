//
//  FileManager+Extension.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/11/19.
//

import Foundation
import UIKit


extension FileManager {
    
    func checkDocument(savePath:String) -> Bool{
        guard let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else { return false}
        
        var filePath = URL(fileURLWithPath: path)
        filePath.appendPathComponent(savePath.substring(from: 29))
        return FileManager().fileExists(atPath: filePath.path)
    }
    

    func saveDocument(data:Data, savePath:String, completion: ((Error?) -> Void)? = nil) {
        guard let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else { return }
        
        var filePath = URL(fileURLWithPath: path)
        filePath.appendPathComponent(savePath.substring(from: 29))
    
        print(filePath)
        FileManager().createFile(atPath: filePath.path, contents: data, attributes: nil)
    

    }
    
    func getDocument(savePath:String) -> UIImage {
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first ?? ""
        var filePath = URL(fileURLWithPath: path)
        filePath.appendPathComponent(savePath.substring(from: 29))
        
        if let image = UIImage(data: try! Data(contentsOf: filePath)) {
            return image
        }
        
        return UIImage()
    }
    

    
    
}


extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
