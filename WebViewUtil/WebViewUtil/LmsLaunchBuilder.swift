//
//  Untitled.swift
//  TestProject
//
//  Created by apple on 2025/4/22.
//

public struct LmsLaunchBuilder{
    
    var baseUrl: String
    var token: String
    var profile: LmsUserProfile
	
	public static func create(baseUrl: String) -> LmsLaunchBuilder {
        return LmsLaunchBuilder(baseUrl: baseUrl)
    }
    
    init(baseUrl: String){
        self.baseUrl = baseUrl
        self.token = ""
        self.profile = LmsUserProfile()
    }
    
    public func token(token: String) -> Self {
        var	builder = self
        builder.token = token
        return builder
    }
    
    public func profile(profile: LmsUserProfile) -> Self{
        var builder = self
        builder.profile = profile
        return builder
    }
    
    public func launch() -> LmsWebView {
        let finalUrl = baseUrl + "?type=access-token&sso=" + token
        return LmsWebView.create(url: finalUrl)
    }
    	
}
