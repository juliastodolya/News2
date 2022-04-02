import Foundation

struct NewsDetailEntity: Codable {
    let code: Int?
    let news: NewsDetailInfo?
}

struct  NewsDetailInfo: Codable {
    let id: Int?
    let title: String?
    let date: String?
    let shortDescription: String?
    let fullDescription: String?
}
