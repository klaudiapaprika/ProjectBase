import UIKit

protocol Instantiable {
    static func instantiate() -> Self
}

extension Instantiable where Self: UIViewController {
    /// Default implementation loads ViewController from designated Storyboard.
    static func instantiate() -> Self {
        return loadControllerFromDesignatedStoryboard()
    }
}

extension UIViewController: Instantiable {
    static func loadControllerFromDesignatedStoryboard() -> Self {
        func instantiateFromStoryboard<T: UIViewController>(_ viewType: T.Type) -> T {

            let classNameString = String(describing: viewType)
            let storyboard = UIStoryboard(name: classNameString, bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: classNameString) as! T
        }
        return instantiateFromStoryboard(self)
    }
    
    static func loadInitialControllerFromDesignatedStoryboard() -> UIViewController {
        func instantiateFromStoryboard<T: UIViewController>(_ viewType: T.Type) -> T {

            let classNameString = String(describing: viewType)
            let storyboard = UIStoryboard(name: classNameString, bundle: nil)
            return storyboard.instantiateInitialViewController() as! T
        }
        return instantiateFromStoryboard(self)
    }
}

