import DITranquillity
import RxNetworkApiClient

class DI {
    private static let shared = DI()
    fileprivate(set) static var container = DIContainer()

    private init() { }

    static func initDependencies(_ appDelegate: AppDelegate) {
        DI.container = DIContainer()

        ApiEndpoint.baseEndpoint = ApiEndpoint.sebbiaTestApi

        self.container.register { () -> ApiClientImp in
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 60 * 20
            config.timeoutIntervalForResource = 60 * 20
            config.waitsForConnectivity = true
            config.shouldUseExtendedBackgroundIdleMode = true
            config.urlCache?.removeAllCachedResponses()
            let client = ApiClientImp(urlSessionConfiguration: config, completionHandlerQueue: .main)
            client.responseHandlersQueue.append(JsonResponseHandler())
            return client
        }
        .as(ApiClient.self)

        // MARK: - Gateways
        self.container.register(ApiNewsGateway.init)
            .as(NewsGateway.self)
            .lifetime(.single)

        // MARK: - UseCases
        self.container.register(NewsUseCaseImp.init)
            .as(NewsUseCase.self)
    }

    static func resolve<T>() -> T {
        return self.container.resolve()
    }
}
