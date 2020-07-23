//
//  ValidationProtocol.swift
//  Lawyer
//
//  Created by Aman Kumar on 23/07/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
protocol ValidationProtocol {
    
    //TODO: Validate email
    func isValidEmail(_ email: String) -> Bool
    
    //TODO: Validate password
    func isValidPasssword(_ password: String) -> Bool
    
    //TODO: Validate phone number
    func isValidPhone(_ value: String) -> Bool
    
    //TODO: Validate indian phone count
    func isValidIndianPhoneCount(_ value: String) -> Bool
    
    //TODO: Validate indian phone number
    func isValidIndianPhone(_ value: String) -> Bool
    
    //TODO: Validate fullName
    func isValidFullName(_ fullName: String) -> Bool
    
    //TODO: Validate username
    func isValidUsername(_ username: String) -> Bool
    
    //TODO: Validate OTP count
    func isValidOTPCount(_ value: String) -> Bool
    
    //TODO: Validate empty field
    func checkEmptyField(_ value: String) -> Bool
    
}
