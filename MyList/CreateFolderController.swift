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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        self.tfGroupName.delegate = self
        setupForm()
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

