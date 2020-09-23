//
//  SCustomerApi.swift
//  Lawyer
//
//  Created by Aman Kumar on 17/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
struct SCustomerApi {
    //TODO: Version 1 services
    public static let lawyer_list                    = "v1/lawyer-list?"
    public static let filter_list                    = "v1/filter-list"
    public static let consultation_slot              = "v1/consultation-slot?CurrentDate="
    public static let lawyer_overview                = "v1/lawyer-overview?Uuid="
    public static let check_bookingslot              = "v1/check-bookingslot"
    public static let check_coupon                   = "v1/check-coupon"
    public static let create_order                   = "v1/create-order"
    public static let check_payment                  = "v1/check-payment"
    public static let expertise_list                 = "v1/expertise-list"
    
    
    //TODO: Version 2 services
    public static let checkslot                      = "v2/customer/checkslot?CurrentDate="
    public static let multiple_doc                   = "v2/customer/multiple-doc"
    public static let book_consultation              = "v2/customer/book-consultation"
    public static let booking_form                   = "v2/customer/booking-form"
    public static let delete_document                = "v2/customer/delete-document"
    public static let get_packages                   = "v2/get-packages"
    
    
}
