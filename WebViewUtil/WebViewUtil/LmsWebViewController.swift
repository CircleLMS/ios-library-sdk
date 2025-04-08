import SwiftUI
@preconcurrency import WebKit

class LmsWebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize a WKWebViewConfiguration object.
        let webViewConfiguration = WKWebViewConfiguration()
        // Let HTML videos with a "playsinline" attribute play inline.
        webViewConfiguration.allowsInlineMediaPlayback = true
        // Let HTML videos with an "autoplay" attribute play automatically.
        webViewConfiguration.mediaTypesRequiringUserActionForPlayback = []

        webView = WKWebView(frame: view.bounds, configuration: webViewConfiguration)
        view.addSubview(webView)
        
        // 设置webView的UIDelegate为当前视图控制器
        webView.uiDelegate = self
        
        // 解决底部加载不全问题
        webView.navigationDelegate = self
                view.addSubview(webView)
                webView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                    webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                ])
        
    }

    // 当用户点击网页上的链接时，会调用该方法，可以在该方法中处理打开新选项卡的逻辑
    func webView(_ wkWebView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        // 检查navigationAction的targetFrame属性，如果为nil，表示目标网页会在新选项卡中打开
        if navigationAction.targetFrame == nil {
            if let url = navigationAction.request.url {
                // 在当前 WKWebView 中加载新页面
                webView.load(navigationAction.request)
            }
        }
        // 返回nil表示目标网页将在当前选项卡中打开
        return nil
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            if url.absoluteString.contains("/document") {
                openSafari(with: url.absoluteString)
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
    
    func openSafari(with urlString: String) {
        // 确保 URL 字符串是有效的
        guard let url = URL(string: urlString) else {
            return
        }
        
        // 检查是否可以打开 URL
        if UIApplication.shared.canOpenURL(url) {
            // 打开 URL
            UIApplication.shared.open(url, options: [:]) { success in
                if success {
                    print("URL opened successfully")
                } else {
                    print("Failed to open URL")
                }
            }
        } else {
            print("Cannot open URL")
        }
    }

}
