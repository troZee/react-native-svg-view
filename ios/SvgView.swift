import Foundation
import SwiftSVG

//                            let asd = """
//                            <svg height="30" viewBox="0 0 110 178" width="30" xmlns="http://www.w3.org/2000/svg"><path d="m100 169h-17.3161395-57.2729406-16.4109199v-26h6.473846 78.0472225 6.4789315zm-81-59h3.5659586 61.1168128 6.3172286v26h-71zm11-8h48v-15h-48zm43.7927774-54.9877828c4.3005504 1.9871522 4.279128 5.0103865 4.1827271 5.8179991-.0589117.3134813-.0856897.6322757-.0856897.9510702v4.2187135h-47.8898148v-5.8711315c1.2532114-4.7925436 4.7504211-5.2176029 6.4909926-5.1166513zm-43.7927774 32.9877828h48v-15h-48zm66.9904083 54.056337v-28.373801c0-2.762936-2.168996-4.996267-4.8415091-4.996267h-5.4757467v-16.1779132c.009683-.1348992.0726226-.2498133.0726226-.3897088 0-.1348992-.0629396-.2498134-.0726226-.3847126v-29.5129501c.5277245-4.2917935-1.045766-12.5656119-10.6706861-16.3877563-.5567735-.2198357-1.1425961-.3347499-1.7381017-.3347499l-14.6794556.0049963v-12.3157985c0-2.7579395-2.1641546-4.9962672-4.8415091-4.9962672-2.672513 0-4.8415091 2.2383277-4.8415091 4.9962672v12.3207948l-5.8824335.0049962v-25.5209326h10.7239426c2.6773545 0 4.8415091-2.23333141 4.8415091-4.99626714 0-2.76293574-2.1641546-4.99626716-4.8415091-4.99626716h-15.5654517c-2.6773545 0-4.8415091 2.23333142-4.8415091 4.99626716v31.31660254c-4.1685393 1.4089473-8.6614598 4.881353-10.2155842 12.3657612-.0726226.3447424-.1065132.6994774-.1065132 1.0492161v48.958422h-6.1680826c-2.672513 0-4.841509 2.233331-4.841509 4.996267v28.373801h-6.16324111c-2.67251302 0-4.84150909 2.238328-4.84150909 4.996267v31.951129c0 2.762936 2.16899607 4.996267 4.84150909 4.996267h15.62354981 64.2080936 16.4853385c2.672513 0 4.841509-2.233331 4.841509-4.996267v-31.951129c0-2.757939-2.168996-4.996267-4.841509-4.996267z" fill="#f00" fill-rule="evenodd" opacity="1" stroke="#f00" stroke-width="3"/></svg>
//                            """.data(using: .utf8)

class SvgView: UIView {
    
    @objc func setSource(_ val: NSString?) {
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
  
        
//        guard let serviceUrl = URL(string: val as String) else { return }
//        let request = URLRequest(url: serviceUrl)
//        let session = URLSession.shared
//        session.dataTask(with: request) { (data, response, error) in
//            guard let _ = response else {
//                return
//            }
//            guard let data = data else {
//                return
//            }
//
//            do {
//                let str = String(decoding: data, as: UTF8.self)
//                let node = try SVGParser.parse(text: str)
//                DispatchQueue.main.async { [self] in
////                    let asd = CGRect(x: node.bounds?.x ?? 0, y: node.bounds?.y ?? 0, width: node.bounds?.w ?? 0, height: node.bounds?.h ?? 0)
//                    let macaw = MacawView(node: node, frame: self.frame)
//                    self.addSubview(macaw)
//                    self.layoutSubviews()
//                }
//            } catch {
//                print(error)
//            }
//        }.resume()
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
