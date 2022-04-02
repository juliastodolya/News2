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
            client.responseHandlersQueue.append(ErrorResponseHandler())
            client.responseHandlersQueue.append(JsonResponseHandler())
            if ProcessInfo.processInfo.arguments.contains("IS_NETWORK_LOGGING_ENABLED") {
                client.interceptors.append(ExtendedLoggingInterceptor())
            }
            client.interceptors.append(JsonContentInterceptor())
            client.interceptors.append(ExtraPathInterceptor())
            return client
        }
        .as(ApiClient.self)
        
        // MARK: - Gateways
        self.container.register(ApiNewsGateway.init)
            .as(NewsGateway.self)
            .lifetime(.single)
        
//        self.container.register(ApiPhotosPaginationGateway.init)
//            .as(PhotosPaginationGateway.self)
//            .lifetime(.single)
        
        // MARK: - UseCases
        
//        self.container.register(ApiRegistrationUseCase.init)
//            .as(RegistrationUseCase.self)
//
        self.container.register(NewsUseCaseImp.init)
            .as(NewsUseCase.self)
//
//
//        self.container.register(PhotosPaginationUseCaseImp.init)
//            .as(PhotosPaginationUseCase.self)
        
    }
    
    static func resolve<T>() -> T {
        return self.container.resolve()
    }
}
