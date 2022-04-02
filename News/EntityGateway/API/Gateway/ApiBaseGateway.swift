//
//  ApiBaseGateway.swift
//  Linolit
//
//  Created by Алеся on 23/11/2018.
//  Copyright © 2018 webAnt. All rights reserved.
//

import Foundation
import RxNetworkApiClient

class ApiBaseGateway {

    let apiClient: ApiClient

    init(_ apiClient: ApiClient) {
        self.apiClient = apiClient
    }
}
