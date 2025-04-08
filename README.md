# iOS Library Integration Guide

## **1. Add the following line to your `Podfile`** (version number varies)  
```
pod 'LmsWebView', '0.0.3', :source => 'https://github.com/CircleLMS/ios-library-sdk.git'
```

## **2. Run pod install**   
```
pod install
```

## **3. Use the WebView Library in Your Code**  
Open a WebView with a specified URL using the following function:
LmsWebView.create (url: “www.sample.com”)  
This will launch a WebView and load the specified URL within your application.
```
LmsWebView.create(url: “https://safetytraining.hercrentals.com/?access_token={accessToken}”)
```

## **4. Sample URLs:**  
Course catalog page: https://qasafetytraining.hercrentals.com/course/catalog/  
Course detail page: https://qasafetytraining.hercrentals.com/course/catalog/b8ba1023e33a11eab2fb0242ac120002

## **5. Sample code:**  
```
import SwiftUI
import LmsWebView

struct ContentView: View {   
    // Used for Navigation status
    @State private var isActive: Bool = false    
    // URL to load with webview
    @State private var url: String = " https://safetytraining.hercrentals.com/?access_token={accessToken}"
    var body: some View {
        NavigationView {	
            VStack {                
                TextField("URL", text: $url)
                    .padding() 
                NavigationLink(destination: LmsWebView.create(url: url), isActive: $isActive){
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
        
    }
}

#Preview {
    ContentView()
}

```
