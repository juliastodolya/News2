//
//  ApiChangePasswordEntity.swift
//  CardioBit
//
//  Created by Stanislav on 06.05.2020.
//  Copyright © 2020 Webant. All rights reserved.
//

import Foundation
import RxNetworkApiClient

struct CodeVerificationEntity: JsonBodyConvertible {
    var phone: String?
    var email: String?
    var newPassword: String?
    var code: String?
}

struct ChangePasswordEntity: JsonBodyConvertible {
    let oldPassword: String?
    let newPassword: String?
}
