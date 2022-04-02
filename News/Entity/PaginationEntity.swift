import Foundation

class PaginationEntity<T: Codable>: Codable {
    var code: Int
    var list: [T]

    init(code: Int, list: [T]) {
        self.code = code
        self.list = list
    }
}
