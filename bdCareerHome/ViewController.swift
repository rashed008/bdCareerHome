import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Spinner animation
        spinner.startAnimating()
        //spinner.isHidden = false
        // Do any additional setup after loading the view, typically from a nib.
        let myURL = URL(string:"https://bdcareerhome.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.navigationDelegate = self
        webView.load(myRequest)
        
        //DispatchQueue.main.asyncAfter(deadline: .now() + 13.0) {
        //self.spinner.stopAnimating()
        //self.spinner.isHidden = true
        //}
        //MARK: - Activity Indicator
        increaseSizeOfActivityIndicator()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func increaseSizeOfActivityIndicator(){
        let transform = CGAffineTransform(scaleX: 4, y: 4)
        spinner.transform = transform
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
        self.spinner.isHidden = true
    }
}
