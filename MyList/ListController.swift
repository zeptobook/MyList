import UIKit

class ListController: UIViewController {
//    func formControllerDidFinish(_ controller: CreateFolderController) {
//        print("hi")
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureBarItems()
    }
    
    private func configureBarItems() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: nil),
            //UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
            UIBarButtonItem(image: UIImage(systemName: "folder.badge.plus"), style: .done, target: self, action: #selector(openCreateFolderBS))
            ]
    }
    
    @objc func openCreateFolderBS() {
        
        let createFolderController = CreateFolderController()
        let nav = UINavigationController(rootViewController: createFolderController)
        nav.modalPresentationStyle = .pageSheet
        //createFolderController.text = "Hello Adesh"
        //createFolderController.tfGroupName.becomeFirstResponder()

        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
        }

        present(nav, animated: true, completion: nil)
    }
}
