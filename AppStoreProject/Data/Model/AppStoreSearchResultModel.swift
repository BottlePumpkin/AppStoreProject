//
//  ResultResponse.swift
//  AppStoreProject
//
//  Created by Dustin on 2021/10/05.
//

import Foundation


// MARK: - ResultResponse
struct AppStoreSearchResultModel: Decodable {
    let resultCount: Int?
    let results: [SearchResultModel]?
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case results
    }
}

//MARK: - Result
struct SearchResultModel: Decodable {
    let ipadScreenshotUrls: [String]?
    let appletvScreenshotUrls: [String]?
    let artworkUrl60: String?
    let artworkUrl512: String?
    let artworkUrl100: String?
    let artistViewURL: String?
    let screenshotUrls: [String]?
    let features: [String]?
    let advisories: [String]?
    let supportedDevices: [String]?
    let isGameCenterEnabled: Bool?
    let kind: String?
    let trackViewURL: String?
    let minimumOSVersion : String?
    let trackCensoredName: String?
    let languageCodesISO2A: [String]?
    let fileSizeBytes: String?
    let sellerURL: String?
    let formattedPrice: String?
    let contentAdvisoryRating: String?
    let averageUserRatingForCurrentVersion: Double?
    let userRatingCountForCurrentVersion: Int?
    let averageUserRating: Double?
    let trackContentRating: String?
    let bundleID: String?
    let primaryGenreName: String?
    let genreIDS: [String]?
    let isVppDeviceBasedLicensingEnabled: Bool?
    let trackID: Int?
    let trackName, sellerName: String?
    let releaseDate, currentVersionReleaseDate: String?
    let releaseNotes: String?
    let primaryGenreID: Int?
    let currency: String?
    let resultDescription: String?
    let artistID: Int?
    let artistName: String?
    let genres: [String]?
    let price: Int?
    let version: String?
    let wrapperType: String?
    let userRatingCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case ipadScreenshotUrls, appletvScreenshotUrls, artworkUrl60, artworkUrl512, artworkUrl100
        case artistViewURL
        case screenshotUrls, features, advisories, supportedDevices, isGameCenterEnabled, kind
        case trackViewURL
        case minimumOSVersion
        case trackCensoredName, languageCodesISO2A, fileSizeBytes
        case sellerURL
        case formattedPrice, contentAdvisoryRating, averageUserRatingForCurrentVersion, userRatingCountForCurrentVersion, averageUserRating, trackContentRating
        case bundleID
        case primaryGenreName
        case genreIDS
        case isVppDeviceBasedLicensingEnabled
        case trackID
        case trackName, sellerName, releaseDate, currentVersionReleaseDate, releaseNotes
        case primaryGenreID
        case currency
        case resultDescription
        case artistID
        case artistName, genres, price, version, wrapperType, userRatingCount
        
    }
    
}

