import Foundation

struct NewsCategoryList: Codable {
    let code: Int?
    let list: [NewsCategory]?
}

struct NewsCategory: Codable {
    let id: Int?
    let name: String?
}
