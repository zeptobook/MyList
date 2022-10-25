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
        createFolderController.text = "Hello Adesh"
        //createFolderController.delegate = self
        
//        let formNC = UINavigationController(rootViewController: createFolderController)
//        formNC.modalPresentationStyle = UIModalPresentationStyle.pageSheet
        
        if let sheet = createFolderController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        
//        if let sheet = formNC.presentationController as? UISheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.prefersGrabberVisible = true
//        }
        
        present(createFolderController, animated: true, completion: nil)
        print("opensheet")
    }
}
