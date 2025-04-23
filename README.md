# iOS Library Integration Guide

## **1. Add the following line to your `Podfile`** (version number varies)  
```
pod 'LmsWebView', '0.0.7', :source => 'https://github.com/CircleLMS/ios-library-sdk.git'
```

## **2. Run pod install**   
```
pod install
```
## **3. Sample URLs:**  
Course catalog page: https://qasafetytraining.hercrentals.com/course/catalog/?iframe  
Course detail page (used in email invitation): https://qasafetytraining.hercrentals.com/course/catalog/b8ba1023e33a11eab2fb0242ac120002?iframe

## **4. Use the WebView Library in Your Code:**  
Open a WebView with a specified URL using the following function:  
This will launch a WebView and load the specified URL within your application.  
```
import SwiftUI
import LmsWebView

struct ContentView: View {   
    // Used for Navigation status
    @State private var isActive: Bool = false    
    // URL to load with webview
    @State private var url: String = " https://qasafetytraining.hercrentals.com/course/catalog?iframe&access_token={accessToken}"
    var body: some View {
        NavigationLink(destination:
                                LmsLaunchBuilder
                                .create(baseUrl: "https://safetytraining.hercrentals.com")
                                .token(token: "access_token_here")
                                .profile(profile:
                                            LmsUserProfile.create(
                                                accountNumber:"123456",
                                                accountName:"John Doe",
                                                role:"Admin",
                                                driverLicense:"D12345678",
                                                country:"US",
                                                userType:"Credit",
                                                phoneNumber:"+11234567890",
                                                accountStatus:"A"
                                            )
                                )
                                .launch()
                               , isActive: $isActive) {
                    Button("Load Page") {
                        isActive = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }  
    }
}

#Preview {
    ContentView()
}

```
