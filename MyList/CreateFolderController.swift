import UIKit

protocol FormControllerDelegate: AnyObject {
    func formControllerDidFinish(_ controller: CreateFolderController)
}

class CreateFolderController: UIViewController, UITextFieldDelegate {
    
    var text: String? {
        didSet {
            //textField.text = text
        }
    }
    
    //weak var delegate: FormControllerDelegate?
    var tfGroupName = UITextField()
    var reminderBtn = UIButton(type: .system)
    var calendarBtn = UIButton(type: .system)
    var favoriteBtn = UIButton(type: .system)
    var stackView = UIStackView()
    
//    private var reminderBtn: UIButton = {
//        //let btn = UIBarButtonItem(image: UIImage(systemName: "folder.badge.plus"), style: .done, target: CreateFolderController.self, action: nil)
//        let btn =  UIButton()
//        btn.setImage(UIImage(named: "folder.badge.plus"), for: .normal)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
    
//    private var calendarBtn: UIButton = {
//        //let btn = UIBarButtonItem(image: UIImage(systemName: "folder.badge.plus"), style: .done, target: CreateFolderController.self, action: nil)
//        let btn = UIButton()
//        btn.setImage(UIImage(named: "folder.badge.plus"), for: .normal)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
    
//    private var favoriteBtn: UIButton = {
//        //let btn = UIBarButtonItem(image: UIImage(systemName: "folder.badge.plus"), style: .done, target: CreateFolderController.self, action: nil)
//        let btn = UIButton()
//        btn.setImage(UIImage(named: "folder.badge.plus"), for: .normal)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
    
//    lazy var stackView: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .horizontal
//        stack.spacing = 20.0
//        stack.alignment = .fill
//        stack.distribution = .equalSpacing
//
//
//        stack.addArrangedSubview(self.reminderBtn)
//        stack.addArrangedSubview(self.calendarBtn)
//        stack.addArrangedSubview(self.favoriteBtn)
//
//        return stack
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        self.tfGroupName.delegate = self
        setupForm()
        setupButtons()
    }
    
    override func viewWillLayoutSubviews() {
        //addNavigationButtons()
    }
    
    private func addNavigationButtons() {
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        self.view.addSubview(navigationBar);
        let navigationItem = UINavigationItem(title: "Add Group")
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
        tfGroupName.placeholder = "Add your group name"
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
    
    private func setupButtons() {
//        reminderBtn.setImage(UIImage(named: "folder.badge.plus"), for: .normal)
//        calendarBtn.setImage(UIImage(named: "folder.badge.plus"), for: .normal)
//        favoriteBtn.setImage(UIImage(named: "folder.badge.plus"), for: .normal)
        
        // Reminder Button
        reminderBtn.backgroundColor = .blue
        reminderBtn.setTitle("Rem", for: .normal)
        reminderBtn.tintColor = .white
        reminderBtn.layer.cornerRadius = 5
        reminderBtn.clipsToBounds = true
        reminderBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Calendar Button
        calendarBtn.backgroundColor = .blue
        calendarBtn.setTitle("Cal", for: .normal)
        calendarBtn.tintColor = .white
        calendarBtn.layer.cornerRadius = 5
        calendarBtn.clipsToBounds = true
        calendarBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        // Favorite Button
        favoriteBtn.backgroundColor = .blue
        favoriteBtn.setTitle("Fav", for: .normal)
        favoriteBtn.tintColor = .white
        favoriteBtn.layer.cornerRadius = 5
        favoriteBtn.clipsToBounds = true
        favoriteBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(reminderBtn)
        view.addSubview(calendarBtn)
        view.addSubview(favoriteBtn)
        NSLayoutConstraint.activate([
            reminderBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            reminderBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            reminderBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)])
        
        NSLayoutConstraint.activate([
            calendarBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            calendarBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            calendarBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)])
        
        NSLayoutConstraint.activate([
            favoriteBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            favoriteBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            favoriteBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        //Stack View
//        stackView.axis = .horizontal
//        stackView.spacing = 20.0
//        stackView.alignment = .fill
//        stackView.distribution = .equalSpacing
//        stackView.addArrangedSubview(reminderBtn)
//        stackView.addArrangedSubview(calendarBtn)
//        stackView.addArrangedSubview(favoriteBtn)
//        view.addSubview(stackView)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
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
        print(tfGroupName.text!)
        tfGroupName.resignFirstResponder()
        self.dismiss(animated: true)
        return true
    }
}

