
import UIKit
import MaterialComponents.MaterialBottomNavigation

class MenuBar: UIView {
    
    var size: CGSize?
    var height: CGFloat?
    var width: CGFloat?
    
    init(height: CGFloat?, width: CGFloat?, size: CGSize?) {
        super.init(frame: frame)
        self.height = height
        self.width = width
        self.size = size
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bottomNavBar: MDCBottomNavigationBar = {
        let bnb = MDCBottomNavigationBar()
        return bnb
    }()

    func layoutBottomNavBar() {
      let size = bottomNavBar.sizeThatFits(self.bounds.size)
      var bottomNavBarFrame = CGRect(x: 0,
                                     y: self.bounds.height - size.height,
                                     width: size.width,
                                     height: 500)
      // Extend the Bottom Navigation to the bottom of the screen.
//      if #available(iOS 11.0, *) {
//        let heightAdjustment = bottomNavBarFrame.size.height + self.safeAreaInsets.bottom + 100
//        bottomNavBarFrame.size.height += heightAdjustment
//        bottomNavBarFrame.origin.y -= self.safeAreaInsets.bottom
//      }
      bottomNavBar.frame = bottomNavBarFrame
    }
}

