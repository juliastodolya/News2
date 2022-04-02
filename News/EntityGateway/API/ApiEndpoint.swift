import Foundation
import RxNetworkApiClient

extension ApiEndpoint {

    private(set) static var sebbiaTestApi = ApiEndpoint(Config.apiEndpoint)
    
    static func updateEndpoint() {
        ApiEndpoint.sebbiaTestApi = ApiEndpoint(Config.apiEndpoint)
    }
}
