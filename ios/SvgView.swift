import Foundation
import SwiftSVG
import WebKit
import Macaw

class SvgView: UIView {
    
    let webView = WKWebView()
    var node: Node?
    
    var source: NSString? {
        set(val) {
            guard let val = val else {
                return;
            }
            let svgURL = URL(string: val as String)!
            //            if let svgString = try? String(contentsOf: svgURL) {
            //
            //                webView.loadHTMLString(svgString, baseURL: svgURL)
            //                webView.frame = self.frame
            //                webView.backgroundColor = .red
            //                DispatchQueue.main.async { [self] in
            //                    self.addSubview(self.webView)
            //                    self.layoutSubviews()
            //                    self.layoutIfNeeded()
            //                }
            //
            //            }
            if let svgString = try? String(contentsOf: svgURL) {
                node = try! SVGParser.parse(text: svgString)
                DispatchQueue.main.async { [self] in
                    self.layoutIfNeeded()
                }
                
            }

        }
        get {
            return nil
        }
    }
    
    private var svgLayer: SVGLayer? = nil
    
    override func layoutSubviews() {
        super.layoutSubviews()

        guard let node = node else {
            return;
        }
        let macaw = MacawView(node: node, frame: self.frame)
        self.addSubview(macaw)
    }
    
    @objc func setSource(_ val: NSString) {
        source = val
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    deinit {
        svgLayer = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
