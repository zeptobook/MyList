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
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var favoriteBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "star", withConfiguration: config), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
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

