//
//  ContentView.swift
//  webView
//
//  Created by apple on 2024/12/19.
//

import SwiftUI
import WebKit

public struct LmsWebView: View {
    
    public static func create(url: String) -> LmsWebView {
            return LmsWebView(url: url)
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var url: String
    
    @State var webView = WKWebView()
    
    @State var operate = Operate(reload: false, goBack: false)
    
    @State var update = false
    
    public var body: some View {
        VStack {
        
            HStack{
                Button(action:{
                    update = false
                    operate = Operate(reload: true, goBack: false)
                    update = true
                }){
                    Text("Refresh")
                        .padding()
                }
                
                Button(action:{
                    update = false
                    operate = Operate(reload: false, goBack: true)
                    update = true
                }){
                    Text("Back")
                        .padding()
                }
                
                Spacer()
                
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Exit")
                        .padding()
                }

            }

            LmsWebViewControllerRepresentable(
                url: URL(string: url),
                operate: $operate,
                update: $update
            )
        }.navigationBarBackButtonHidden(true)
    }
    
}

