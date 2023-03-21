import UIKit
import CoreData

protocol FormControllerDelegate: AnyObject {
    func formControllerDidFinish(_ controller: CreateFolderController)
}

class CreateFolderController: UIViewController, UITextFieldDelegate {
    
    var update: (() -> Void)?
    var isFavorite: Bool = false
    
    var text: String? {
        didSet {
            //textField.text = text
        }
    }
    
    //weak var delegate: FormControllerDelegate?
    var tfGroupName = UITextField()
    
    var config = UIImage.SymbolConfiguration(pointSize: 28, weight: .regular, scale: .small)
    
    lazy var reminderBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "bell", withConfiguration: config), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var calendarBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "calendar", withConfiguration: config), for: .normal)
        btn.addTarget(self, action: #selector(self.openCalendar), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var favoriteBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "star", withConfiguration: config), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(self.favoriteBtnAction), for: .touchUpInside)
        return btn
    }()
    
    // Stack View
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        stack.addArrangedSubview(self.reminderBtn)
        stack.addArrangedSubview(self.calendarBtn)
        stack.addArrangedSubview(self.favoriteBtn)
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        self.tfGroupName.delegate = self
        setupForm()
        //setupButtons()
        
        setImageAndConstraints()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addStackViewConstraints()
    }
    
    func setImageAndConstraints() {
        self.view.addSubview(reminderBtn)
        self.view.addSubview(calendarBtn)
        self.view.addSubview(favoriteBtn)
//        someImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        someImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        reminderBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reminderBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        //addNavigationButtons()
    }
    
    private func addNavigationButtons() {
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        self.view.addSubview(navigationBar);
        let navigationItem = UINavigationItem(title: "Add Task")
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(save))
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = doneBtn
        navigationItem.leftBarButtonItem = cancelBtn
        navigationBar.setItems([navigationItem], animated: false)
    }
    
    private func setupForm() {
        tfGroupName.translatesAutoresizingMaskIntoConstraints = false
        //tfGroupName.addTarget(self, action: #selector(handleNewText), for: .editingDidEnd)
        //textField.borderStyle = .roundedRect
        tfGroupName.placeholder = "Add Task"
        tfGroupName.autocorrectionType = .no
        tfGroupName.keyboardType = .default
        tfGroupName.returnKeyType = UIReturnKeyType.done
        tfGroupName.clearButtonMode = .whileEditing
        tfGroupName.becomeFirstResponder()
        
        view.addSubview(tfGroupName)
        
        NSLayoutConstraint.activate([
            tfGroupName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            tfGroupName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tfGroupName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)])
        
    }
    
    @objc private func handleNewText() {
        text = tfGroupName.text
        print(tfGroupName.text!)
    }
    
    @objc private func cancel() {
        self.dismiss(animated: true)
    }
    
    @objc private func save() {
        print(tfGroupName.text!)
        tfGroupName.resignFirstResponder()
        self.dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let groupname = tfGroupName.text, !groupname.isEmpty else {
            return false
        }
        
        //createGroup(groupName: tfGroupName.text!)
        createGroup(groupName: groupname, isFav: isFavorite)
        readGroup()
        tfGroupName.resignFirstResponder()
        self.dismiss(animated: true)
        
//        let lc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "listController") as! ListController
//
//        lc.readGroup()
        
        update?()
        return true
    }
    
    private func createGroup(groupName: String, isFav: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let groupEntity = NSEntityDescription.entity(forEntityName: "Groups", in: managedContext)!
        
        let group =  NSManagedObject(entity: groupEntity, insertInto: managedContext)
        
        group.setValue(groupName, forKey: "groupName")
        group.setValue(isFav, forKey: "isFavorite")
        group.setValue(Date.getCurrentDate(), forKey: "reminderDate")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    private func readGroup() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "Groups")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "groupName") as! String)
                print(data.value(forKey: "reminderDate") as! String)
            }
        } catch let error as NSError {
            print("Reading failed. \(error)")
        }
    }
    
    private func addStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
//            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func favoriteBtnAction(sender: UIButton) {
        isFavorite = !isFavorite
        
        if(isFavorite == true) {
            sender.setImage(UIImage(systemName: "star.fill", withConfiguration: config), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "star", withConfiguration: config), for: .normal)
        }
    }
    
    @objc private func openCalendar(sender: UIButton) {
        let calendarPopup = CalendarPopupViewController()
        calendarPopup.appear(sender: self)
    }
}

extension Date {
    static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: Date())
    }
}

