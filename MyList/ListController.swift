import UIKit
import CoreData

class ListController: UIViewController {
//    func formControllerDidFinish(_ controller: CreateFolderController) {
//        print("hi")
//    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var groupNames: [NSManagedObject] =  []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        configureBarItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        readGroup()
    }
    
    public func readGroup() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest =  NSFetchRequest<NSManagedObject>(entityName: "Groups")
        
        do {
            groupNames = try managedContext.fetch(fetchRequest)
            
            
        } catch let error as NSError {
            print("Reading failed. \(error)")
        }
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

extension ListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group =  groupNames[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text =  group.value(forKeyPath: "groupName") as? String
        return cell
    }
}
