import UIKit

class ListController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureBarItems()
    }
    
    private func configureBarItems() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: nil),
            //UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
            UIBarButtonItem(image: UIImage(systemName: "folder.badge.plus"), style: .done, target: self, action: nil)
            ]
    }
}
