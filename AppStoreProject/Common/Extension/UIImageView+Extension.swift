import UIKit

extension UIImageView {

    func setImage(from url: String?, to placeHolder: String = "default.png",path : String) {
        
        guard let url = url else {
            self.image = UIImage(named: placeHolder)
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            
            
            //memory caching
            let cachedKey = NSString(string: url).lastPathComponent

            if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey as NSString) {
                self?.image = cachedImage
                return
            }
            
            guard let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else { return }
            
            
            
            
            //저장하기
            var filePath = URL(fileURLWithPath: path)
            filePath.appendPathComponent(path+cachedKey)
            
            
            let data = try? Data(contentsOf: URL(string: url)!)
          
            
            if !FileManager.default.fileExists(atPath: filePath.path) {
                FileManager.default.createFile(atPath: filePath.path, contents: data, attributes: nil)
                
            }
            
            
//            guard let image = ImageCacheManager.shared.object(forKey: cachedKey as NSString) else { return }
//            guard let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first else { return }
        
            
            //disk caching
            if FileManager.default.fileExists(atPath: filePath.path) {
                DispatchQueue.main.async {
                    
                    guard let imageData = try? Data(contentsOf: filePath) else { return }
                    
                    guard let image = UIImage(data: imageData) else {
                        return
                    }
                    
                    self?.image = image
                    
 
                }
                
            } else if (ImageCacheManager.shared.object(forKey: cachedKey as NSString) != nil) {
                
                self?.image = ImageCacheManager.shared.object(forKey: cachedKey as NSString)
                
                
            } else {
                
                DispatchQueue.main.async {
                    self?.image = data != nil ? UIImage(data: data!) : UIImage(named: placeHolder)
                    
                }
                
 
            }
        }
    }
}


class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
