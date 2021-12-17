import UIKit
import Kingfisher
import Accelerate

extension UIImageView {
    
    func setImage(fromUrlString urlString: String?, toPlaceHolderImageName placeHolderImageName: String = "" ) {

        guard let url = urlString else {
            self.image = UIImage(named: placeHolderImageName)
            return
        }
        


        
        DispatchQueue.global().async { [weak self] in
            
            DispatchQueue.main.async {
                //저장 한 거 있는지?
                if FileManager().checkDocument(savePath: url) {
                    //문서에서 가져와라
                    
                    self?.image = FileManager().getDocument(savePath: url)
                } else {
                    //저장한거 없으면 저장해라!
                    FileManager().saveDocument(data: (self?.image?.pngData())!, savePath: url) { error in
                        print(error)
                    }
                    
                    //NSCache에 저장
                    self?.image = ImageCacheManager().imageMemoryCacheStorage(url: url)
                    
                }
            
            }
            
        }
    }
}
