//
//  ImageCache.swift
//  AppStoreProject
//
//  Created by 박병호 on 2021/11/19.
//

import Foundation

// loading - 압출된 이미지를 메모리에 로드합니다.
// decoding - 인코딩 된 이미지 데이터를 픽셀당 이미지 정보로 변환합니다.
// rendering - 이미지 버퍼에서 프레임 버퍼로 이미지 데이터를 복사하고 크기를 조정합니다.
//NSLock
//동일한 응용 프로개름 내에서 여러 실행 스레드의 작업을 조정하는 개체


final class ImageCache {
    
    
    
    private lazy var imageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject,AnyObject>()
        
        return cache
    }()
    
    
    private lazy var decodedImageCache: NSCache<AnyObject,AnyObject> = {
        let cache = NSCache<AnyObject,AnyObject>()
        
        return cache
    }()
    
    private let lock = NSLock()
    private let config: Config
    
    struct Config {
        let countLimit: Int
        //캐시가 보유해야 하는 최대 개체 수
        let memoryLimit: Int
        //캐시가 개체 제거를 시작하기 전에 보유 할 수 있는 최대 총 비용
        
        static let defaultConfig = Config(countLimit: 10, memoryLimit: 1024 * 1024 * 1000)
        
        //1024 * 1024 * 1000 = 1000MB
        
        
    }
    
    init(config: Config = Config.defaultConfig) {
        self.config = config
    }
    
    
    
}
