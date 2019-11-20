//
//  ClientLoginViewController.swift
//  AnywhereFitness
//
//  Created by Niranjan Kumar on 11/18/19.
//  Copyright © 2019 NarJesse. All rights reserved.
//

import UIKit
class ClientLoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var loginControl: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    // MARK: - Variables
    var loginType: LoginType = .signUp
    //    var clientController: ClientController?
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
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
        //        guard let clientController = clientController else { return }
        // Need to create Client Controller to create new "Client Account"
        guard let username = usernameTextField.text, !username.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        let client = Client(email: username, password: password)
        if loginType == .signUp {
            // need client controller here to create client
            // clientController.signUp
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
            // clientController.signIn
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
