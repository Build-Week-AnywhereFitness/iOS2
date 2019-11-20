//
//  InstructorLoginViewController.swift
//  AnywhereFitness
//
//  Created by Niranjan Kumar on 11/18/19.
//  Copyright © 2019 NarJesse. All rights reserved.
//

import UIKit

enum LoginType {
    case signUp
    case signIn
}
class InstructorLoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var loginControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    // MARK: - Variables
    var classController: ClassController?
    var loginType: LoginType = .signUp
    // var instructorController: InstructorController?
    override func viewDidLoad() {
        super.viewDidLoad()
        enterButton.layer.cornerRadius = 8.0
    }
    // MARK: - Methods & Functions
    @IBAction func loginSegmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            loginType = .signUp
            enterButton.setTitle("Sign Up", for: .normal)
        } else {
            loginType = .signIn
            enterButton.setTitle("Sign In", for: .normal)
        }
    }
    @IBAction func enterButtonTapped(_ sender: UIButton) {
        //        guard let instructorController = instructorController else { return }
        guard let fullName = nameTextField.text, !fullName.isEmpty else { return }
        guard let username = usernameTextField.text, !username.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        let instructor = Instructor(name: fullName, email: username, password: password)
        if loginType == .signUp {
            // need instructor controller here to create instructor
            // instructorController.signUp
            // Sign Up Alert Controller
            let alertController = UIAlertController(title: "Congrats on Signing Up", message: "Please Sign In", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true) {
                self.loginType = .signIn
                self.loginControl.selectedSegmentIndex = 1
                self.enterButton.setTitle("Sign In", for: .normal)
            }
            // End Alert Controller
        } else {
            // instructorController.signIn
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
