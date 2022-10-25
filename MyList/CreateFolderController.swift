import UIKit

protocol FormControllerDelegate: AnyObject {
    func formControllerDidFinish(_ controller: CreateFolderController)
}

class CreateFolderController: UIViewController {
    
    var text: String? {
        didSet {
            textField.text = text
        }
    }
    
    //weak var delegate: FormControllerDelegate?
    private var textField = UITextField()
    let items = Range(0...20).map { "\($0)" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        setupForm()
    }
    
    override func viewWillLayoutSubviews() {
        addNavigationButtons()
    }
    
    private func addNavigationButtons() {
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        self.view.addSubview(navigationBar);
        let navigationItem = UINavigationItem(title: "Add Group")
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(save))
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = doneBtn
        navigationItem.leftBarButtonItem = cancelBtn
        navigationBar.setItems([navigationItem], animated: false)
    }
    
    private func setupForm() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(handleNewText), for: .editingChanged)
        view.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)])
    }
    
    @objc private func handleNewText() {
        text = textField.text
    }
    
    @objc private func cancel() {
        
    }
    
    @objc private func save() {
        //delegate?.formControllerDidFinish(self)
    }
}
