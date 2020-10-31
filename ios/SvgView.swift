import Foundation
import SwiftSVG

class SvgView: UIView {

    var source: NSString? {
        set(val) {
            guard let val = val else {
                return;
            }
            let svgURL = URL(string: val as String)!
            let hammock = UIView(SVGURL: svgURL) { [weak self] svgLayer in
                guard let self = self else { return }
                self.svgLayer = svgLayer
                self.layoutSubviews()
            }
            addSubview(hammock)
        }
        get {
            return nil
        }
    }
    
    private var svgLayer: SVGLayer? = nil
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(frame)
        guard let layer = svgLayer else {
            return;
        }
        layer.resizeToFit(bounds)
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
