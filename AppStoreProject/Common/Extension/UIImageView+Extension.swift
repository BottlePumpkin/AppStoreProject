import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(fromUrlString urlString: String?, toPlaceHolderImageName placeHolderImageName: String = "" ) {

        guard let url = urlString else {
            self.image = UIImage(named: placeHolderImageName)
            return
        }
        
        print(url)
        
        DispatchQueue.global().async { [weak self] in
            
            DispatchQueue.main.async {
                self?.image = ImageCacheManager().imageMemoryCacheStorage(url: url)
            }
            
        }
    }
}
