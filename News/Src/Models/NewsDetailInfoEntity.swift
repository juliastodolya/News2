import Foundation

struct NewsDetailsEntity: Codable {
    let code: Int?
    let news: NewsDetailsInfo?
}

struct  NewsDetailsInfo: Codable {
    let id: Int?
    let title: String?
    let date: String?
    let shortDescription: String?
    let fullDescription: String?
}
