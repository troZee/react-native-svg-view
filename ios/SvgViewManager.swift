import Foundation

@objc(SvgViewManager)
class SvgViewManager: RCTViewManager {
  
    @objc override func view() -> UIView! {
      return SvgView()
    }
    
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
