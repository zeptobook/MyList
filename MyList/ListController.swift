import UIKit
import CoreData

class ListController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groupNames: [NSManagedObject] =  []
    var tasks = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        configureBarItems()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        readGroup()
    }
    
    @objc public func readGroup() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest =  NSFetchRequest<NSManagedObject>(entityName: "Groups")
        
        
        do {
            groupNames = try managedContext.fetch(fetchRequest)
            let result = try managedContext.fetch(fetchRequest)
            
            tasks.removeAllObjects()
            for data in result {
                let task = Task()
                task.name = data.value(forKey: "groupName") as? String
                task.reminderDate = data.value(forKey: "reminderDate") as? String
                //task.isFavorite = true
                //print(data.value(forKey: "groupName") as! String)
                //print(data.value(forKey: "reminderDate") as! String)
                tasks.add(task)
            }
            
            tableView.reloadData()
            
        } catch let error as NSError {
            print("Reading failed. \(error)")
        }
    }
    
    private func configureBarItems() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .done, target: self, action: #selector(showTaskOptions)),
            //UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
            UIBarButtonItem(image: UIImage(systemName: "folder.badge.plus"), style: .done, target: self, action: #selector(openCreateFolderBS))
            ]
    }
    
    @objc func openCreateFolderBS() {
        
        let createFolderController = CreateFolderController()
        let nav = UINavigationController(rootViewController: createFolderController)
        nav.modalPresentationStyle = .pageSheet
        
        createFolderController.update = {
            DispatchQueue.main.async {
                self.readGroup()
            }
        }

        if let sheet = nav.sheetPresentationController {
            sheet.detents = [.medium()]
        }

        present(nav, animated: true, completion: nil)
    }
    
    @objc func showTaskOptions() {
        print("show task options")
    }
}

extension ListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        let task = tasks[indexPath.row] as! Task
        cell.configure(task: task)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let managedContext = appDelegate.persistentContainer.viewContext
            managedContext.delete(groupNames[indexPath.row])
            
            groupNames.remove(at: indexPath.row)
            tasks.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
