import Foundation

class SvgView: UIView {
    
    private var node: Node?
    
    var source: NSString? {
        set(val) {
            guard let val = val else {
                return;
            }
            let svgURL = URL(string: val as String)!
            // TODO use NSURL here instead of contentsOf
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
        
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let node = node else {
            return;
        }
        let macaw = MacawView(node: node, frame: self.bounds)
        self.addSubview(macaw)
    }
    
    @objc func setSource(_ val: NSString) {
        source = val
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    deinit {
        node = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
