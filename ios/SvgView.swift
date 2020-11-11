import Foundation

class SvgView: UIView {
    
    @objc func setSource(_ val: NSString?) {
        guard let val = val else {
            return;
        }
        
        guard let serviceUrl = URL(string: val as String) else { return }
        let request = URLRequest(url: serviceUrl)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let _ = response else {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                let str = String(decoding: data, as: UTF8.self)
                let node = try SVGParser.parse(text: str)
                DispatchQueue.main.async { [self] in
                    let macaw = MacawView(node: node, frame: self.bounds)
                    self.addSubview(macaw)
                    self.layoutSubviews()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    deinit {
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
