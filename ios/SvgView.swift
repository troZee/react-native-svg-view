import Foundation
import SwiftSVG
import SVGKit

class SvgView: UIView {
    
    @objc func setSource(_ val: NSString?) {
        guard let val = val else {
            return;
        }

        guard let svgURL = URL(string: val as String) else {
            return;
        }
        subviews.forEach { (view) in
            view.removeFromSuperview()
            view.layer.removeAllAnimations();
            view.layer.removeFromSuperlayer();
        }
//
//        DispatchQueue.main.async { [self] in
//            let svgView = UIView(SVGURL: svgURL) { (svgLayer) in
//                svgLayer.resizeToFit(self.frame)
//                self.layoutSubviews()
//            }
//            self.addSubview(svgView)
//        }
//
        
        
        DispatchQueue.main.async { [self] in
            let svgImage = SVGKImage(contentsOf: svgURL)
            let svgView = SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
            svgView?.image.size = CGSize(width: self.bounds.width,height: self.bounds.height)
            svgView?.frame = self.bounds
            addSubview(svgView!)
        }
    }
    
    @objc func setStringSource(_ val: NSString?) {
        guard let val = val, let decoded = (val as String).data(using: .utf8) else {
            return;
        }
        subviews.forEach { (view) in
            view.removeFromSuperview()
            view.layer.removeAllAnimations();
            view.layer.removeFromSuperlayer();
        }

        
        DispatchQueue.main.async { [self] in
            let svgView = UIView(SVGData: decoded){ (svgLayer) in
                svgLayer.resizeToFit(self.bounds)
            }
            self.addSubview(svgView)
            self.layoutSubviews()
        }
  
    }
    
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    deinit {
        subviews.forEach { (view) in
            view.removeFromSuperview()
            view.layer.removeAllAnimations();
            view.layer.removeFromSuperlayer();
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
