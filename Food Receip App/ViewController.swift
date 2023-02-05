//
//  ViewController.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-01-16.
//

import UIKit

class ViewController: UIViewController {

    let loginScreen = LoginViewController()
    let signScreen = SignUpViewController()
    var response = false
    weak var delegate: LoginViewController!
    
    //let frame : frame =
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        view.addSubview(segmentedController)
        segmentedController.addTarget(self, action: #selector(suitDidChange(_: )), for: .valueChanged)
        createSuitSegmentedControl()
        addLoginChild()
        //navigateSignUpView()
        
    }
    
    func addLoginChild(){
        signScreen.view.removeFromSuperview()
        addChild(loginScreen)
        view.addSubview(loginScreen.view)
        loginScreen.didMove(toParent: self)
        setLoginViewConstraint()
        loginScreen.SignUpButton.addTarget(self, action: #selector(self.navigateSignUp(sender:)), for: .touchUpInside)
        //loginScreen.loginButton.addTarget(self, action: #selector(self.navigateHome(sender:)), for: .touchUpInside)
    }
    
    func addSigninChild(){
        loginScreen.view.removeFromSuperview()
        addChild(signScreen)
        view.addSubview(signScreen.view)
        signScreen.didMove(toParent: self)
        setSigninViewConstraint()
        signScreen.LoginButton.addTarget(self, action: #selector(self.navigateLogin(sender:)), for: .touchUpInside)
    }
    
    func setLoginViewConstraint(){
        loginScreen.view.translatesAutoresizingMaskIntoConstraints = false
        loginScreen.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 90).isActive = true
        loginScreen.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0).isActive = true
        loginScreen.view.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        loginScreen.view.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        loginScreen.view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
    }
    
    func setSigninViewConstraint(){
        signScreen.view.translatesAutoresizingMaskIntoConstraints = false
        signScreen.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 90).isActive = true
        signScreen.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 40).isActive = true
        signScreen.view.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0).isActive = true
        signScreen.view.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0).isActive = true
        signScreen.view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
    }
    
    let segmentedController: UISegmentedControl = {
        let items = ["Log in","Sign up"]
        let segmentedControl = UISegmentedControl(items: items)
        
//        segmentedControl.selectedSegmentIndex = 1
//        segmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment;

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = .systemGray4
        segmentedControl.selectedSegmentTintColor = UIColor.systemYellow
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl

    }()
    
    func createSuitSegmentedControl(){
        //view.addSubview(segmentedControl)
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
        segmentedController.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        segmentedController.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        segmentedController.topAnchor.constraint(equalTo: view.topAnchor,constant: 75).isActive = true
        
    }
    
    @IBAction func navigateSignUp(sender: UIButton!){
        segmentedController.selectedSegmentIndex = 1
        addSigninChild()
   }
    
    func navigatedSignUp(){
        self.remove()
        addSigninChild()
        print("Done with navigation")
    }
    
    @IBAction func navigateLogin(sender: UIButton){
        segmentedController.selectedSegmentIndex = 0
        addLoginChild()
    }
    
    @IBAction func navigateHome(sender: AnyObject){
     
        let homeController = HomeViewController()
        homeController.modalPresentationStyle = .fullScreen
        homeController.isModalInPresentation = true
        present(homeController, animated: true, completion: nil)

    }

    @IBAction func suitDidChange(_ segmentedControl:UISegmentedControl){
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            addLoginChild()
        case 1:
            addSigninChild()
        default:
            addSigninChild()
            
        }
    }
    
    
    
}

@nonobjc extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
