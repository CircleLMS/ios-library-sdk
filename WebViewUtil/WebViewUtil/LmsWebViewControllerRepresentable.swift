import SwiftUI
import WebKit

struct LmsWebViewControllerRepresentable: UIViewControllerRepresentable{
    
    var url: URL?
    
    @Binding var lmsOperate: LmsOperate
    
    @Binding var update: Bool
    
    @State var isload = false
    
    func makeUIViewController(context: Context) -> LmsWebViewController {
        let vc = LmsWebViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: LmsWebViewController, context: Context) {
      
        guard let url = url else {
            return
        }
        
        if self.isload == false {
            self.isload = true
            uiViewController.webView.load(URLRequest(url: url))
        }
        
        if update == true {
            if self.lmsOperate.reload{
                uiViewController.webView.reload()
            }
            
            if self.lmsOperate.goBack{
                uiViewController.webView.goBack()
                uiViewController.webView.goBack()
                if(uiViewController.webView.canGoBack) {
                    // 获得存储的栈
                    var backlist = uiViewController.webView.backForwardList.backList
                    var lastItem = backlist.popLast()
                    let currentItem = uiViewController.webView.backForwardList.currentItem
                    while(lastItem?.url.relativePath == currentItem?.url.relativePath) {
                        // 比较返回页和当前页的url的realtive部分，相同的话就不断的弹出栈
                        lastItem = backlist.popLast()
                    }
                    if let lastitem = lastItem {
                        // 调用go函数，直接调转到要返回的web页
                        uiViewController.webView.go(to: lastitem)
                        // 因为上面调用了go函数，backlist中会增加此次web跳转，所以弹出此次跳转
                        backlist.popLast()
                    }
                }
            }
        }
        
    }
    
    typealias UIViewControllerType = LmsWebViewController
    
}
