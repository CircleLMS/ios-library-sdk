//
//  Untitled 2.swift
//  TestProject
//
//  Created by apple on 2025/4/22.
//
public struct LmsUserProfile{
    var accountNumber: String
    var accountName: String
    var role: String
    var driverLicense: String
    var country: String
    var userType: String
    var phoneNumber: String
    var accountStatus: String
	
	public static func create(accountNumber: String,
                              accountName: String,
                              role: String,
                              driverLicense: String,
                              country: String,
                              userType: String,
                              phoneNumber: String,
                              accountStatus: String
    ) -> LmsUserProfile {
            return LmsUserProfile(accountNumber: accountNumber,
                                  accountName: accountName,
                                  role: role,
                                  driverLicense: driverLicense,
                                  country: country,
                                  userType: userType,
                                  phoneNumber: phoneNumber,
                                  accountStatus: accountStatus)
    }
    
    init(){
        self.accountNumber = ""
        self.accountName = ""
        self.role = ""
        self.driverLicense = ""
        self.country = ""
        self.userType = ""
        self.phoneNumber = ""
        self.accountStatus = ""
    }
    
    init(
        accountNumber: String,
        accountName: String,
        role: String,
        driverLicense: String,
        country: String,
        userType: String,
        phoneNumber: String,
        accountStatus: String
    ){
        self.accountNumber = accountNumber
        self.accountName = accountName
        self.role = role
        self.driverLicense = driverLicense
        self.country = country
        self.userType = userType
        self.phoneNumber = phoneNumber
        self.accountStatus = accountStatus
    }
}
	
