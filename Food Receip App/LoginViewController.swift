//
//  LoginViewController.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-01-16.
//

import UIKit
class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var iconClick = true

    
    override func viewDidLoad() {
        iconClick = true
    super.viewDidLoad()
    // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black
        view.addSubview(formView)
        view.addSubview(DiamondView)
        view.addSubview(frameView)
        setupFrame()
        view.addSubview(profileView)
        setupProfilePic()
        view.addSubview(emailText)
        setupEmailText()
        view.addSubview(passwordText)
        setupPasswordText()
        setupToggleBtn()
        Togglebutton.addTarget(self, action: #selector(self.passwordToggle(sender:)), for: .touchUpInside)
        view.addSubview(loginButton)
        setupLoginButton()
        view.addSubview(TitleView)
        setupTitleView()
        view.addSubview(SubTitleView)
        setupSubTitleView()
        view.addSubview(pwdFogetButton)
        setupPwdFogetButton()
        view.addSubview(SignUpView)
        setupSignUpDescription()
        view.addSubview(SignUpButton)
        setupSignUpDBtn()
        loginButton.addTarget(self, action: #selector(self.loginUser(sender:)), for: .touchUpInside)
        self.view = view
        
    }
    
    let formView: UIImageView = {
        let image = UIImage(systemName: "diamond")?.withTintColor(.systemGray4.withAlphaComponent(0.5), renderingMode: .alwaysOriginal)
        
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 400
           formView.frame.size.height = 600
                //formView.center = self.view.center
                
           formView.image = image
           formView.frame = CGRect(x: 95, y: 350, width: 400, height: 600)
        return formView
               
    }()
    
    let DiamondView: UIImageView = {
        let image = UIImage(systemName: "diamond")?.withTintColor(.systemGray4.withAlphaComponent(0.3), renderingMode: .alwaysOriginal)
        
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 300
           formView.frame.size.height = 600
                //formView.center = self.view.center
                
           formView.image = image
           formView.frame = CGRect(x: -190, y: 250, width: 400, height: 600)
        return formView
               
    }()
    
    let TitleView: UILabel = {
        let label = UILabel()
        label.text = "Login Now"
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:36)
        label.textColor = .systemGray4
        return label
               
    }()
    
    let SubTitleView: UILabel = {
        let label = UILabel()
        label.text = "Please enter the details below to continue"
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        label.textColor = .systemGray5
        return label
               
    }()
    
    let profileView: UIImageView = {
        let imageView = UIImageView()
          //imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
          imageView.contentMode = . scaleAspectFill
          if let newImage = UIImage(named: "foods") {
             imageView.image = newImage
          }
        
        
        return imageView;
    }()
    
    let frameView: UIImageView = {
        let image = UIImage(systemName: "circle.circle")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 300
           formView.frame.size.height = 300
                //formView.center = self.view.center
                
           formView.image = image
           //formView.frame = CGRect(x: -25, y: 10, width: 400, height: 600)
        return formView
    }()
    
    let emailText: UITextField = {
        let email = UITextField()
        let leftImgView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 40, height: 40))
        email.layer.cornerRadius = 40
        email.clipsToBounds = true
        email.attributedPlaceholder =  NSAttributedString(string: "Email",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.9)])
        email.textColor = UIColor.white
        
                let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 130.0, height: 130.0))
                        email.leftView = leftView
                        email.leftViewMode = .always
        
        let image = UIImage(systemName: "envelope.fill")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 50
           formView.frame.size.height = 50
                //formView.center = self.view.center
                
           formView.image = image
           formView.frame = CGRect(x: 20, y: 14, width: 30, height: 30)
        let leftView1 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0))
        leftView1.addSubview(formView)
        email.leftView = leftView1
        email.leftViewMode = .always
           
//        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
//                email.leftView = leftView
//                email.leftViewMode = .always
        email.layer.borderColor = UIColor.white.cgColor
        email.layer.borderWidth = 1
        email.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return email
    }()
    
    let passwordText: UITextField = {
        let pass = UITextField()
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 130.0, height: 130.0))
        let leftView1 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0))
        let image = UIImage(systemName: "lock.fill")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        
        pass.layer.cornerRadius = 40
        pass.clipsToBounds = true
        pass.attributedPlaceholder =  NSAttributedString(string: "Password",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.9)])
        pass.textColor = UIColor.white
        
                
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 50
           formView.frame.size.height = 50
                //formView.center = self.view.center
                
        formView.image = image
        formView.frame = CGRect(x: 20, y: 14, width: 30, height: 30)
        
        leftView1.addSubview(formView)
        pass.leftView = leftView1
        pass.leftViewMode = .always
           
        pass.layer.borderColor = UIColor.white.cgColor
        pass.layer.borderWidth = 1
        pass.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return pass
    }()
    func setupToggleBtn(){
        let toggleView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0))
        toggleView.addSubview(Togglebutton)
        
        passwordText.rightView = toggleView
        passwordText.rightViewMode = .always
    }
    
    let Togglebutton : UIButton = {
        let button = UIButton()
        let Eyeimage = UIImage(systemName: "eye.slash.fill")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        button.setBackgroundImage(Eyeimage, for: UIControl.State.normal)
        button.frame = CGRect(x: 10, y: 20, width: 30, height: 20)
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemYellow
        button.setTitle("Let's See Receips", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 20)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    let pwdFogetButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemYellow.withAlphaComponent(0.0)
        button.setTitle("Fogot Password?", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 14)
        button.setTitleColor(UIColor.systemYellow, for: .normal)
        return button
    }()
    
    let SignUpView: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        label.textColor = .systemGray4
        return label
               
    }()
    
    let SignUpButton: UIButton = {
        let SignUpBtn = UIButton(type: .system)
        SignUpBtn.backgroundColor = .systemYellow.withAlphaComponent(0.0)
        SignUpBtn.setTitle("Sign Up", for: .normal)
        SignUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        SignUpBtn.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 14)
        SignUpBtn.setTitleColor(UIColor.systemYellow, for: .normal)
        return SignUpBtn
    }()
    
    func setupFrame(){
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        frameView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        //profileView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor,constant:40).isActive = true
        frameView.topAnchor.constraint(equalTo: view.topAnchor,constant: -30).isActive = true
        frameView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupProfilePic(){
        profileView.layer.cornerRadius = 150
        profileView.clipsToBounds = true
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.widthAnchor.constraint(equalToConstant: 290).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 290).isActive = true
        profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupEmailText(){
        emailText.translatesAutoresizingMaskIntoConstraints = false
        emailText.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailText.heightAnchor.constraint(equalToConstant: 70).isActive = true
        emailText.topAnchor.constraint(equalTo: frameView.topAnchor,constant: 410).isActive = true
        emailText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupPasswordText(){
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordText.heightAnchor.constraint(equalToConstant: 70).isActive = true
        passwordText.topAnchor.constraint(equalTo: emailText.topAnchor,constant: 80).isActive = true
        passwordText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupLoginButton(){
        loginButton.layer.cornerRadius = 25
        loginButton.clipsToBounds = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordText.topAnchor,constant: 100).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 20).isActive = true
    }
    
    func setupSignUpDescription(){
        SignUpView.translatesAutoresizingMaskIntoConstraints = false
        SignUpView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        SignUpView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        SignUpView.topAnchor.constraint(equalTo: loginButton.topAnchor,constant: 60).isActive = true
        SignUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupSignUpDBtn(){
        SignUpButton.translatesAutoresizingMaskIntoConstraints = false
        SignUpButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        SignUpButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        SignUpButton.topAnchor.constraint(equalTo: loginButton.topAnchor,constant: 60).isActive = true
        SignUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50).isActive = true
    }
    
    func setupPwdFogetButton(){
        pwdFogetButton.translatesAutoresizingMaskIntoConstraints = false
        pwdFogetButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        pwdFogetButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        pwdFogetButton.topAnchor.constraint(equalTo: passwordText.topAnchor,constant: 65).isActive = true
        pwdFogetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupTitleView(){
        TitleView.translatesAutoresizingMaskIntoConstraints = false
        TitleView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        TitleView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        TitleView.topAnchor.constraint(equalTo: frameView.topAnchor,constant: 340).isActive = true
        TitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupSubTitleView(){
        SubTitleView.translatesAutoresizingMaskIntoConstraints = false
        SubTitleView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        SubTitleView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        SubTitleView.topAnchor.constraint(equalTo: TitleView.topAnchor,constant: 30).isActive = true
        SubTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 10).isActive = true
        
    }
    
    @IBAction func passwordToggle(sender: AnyObject){
        if iconClick{
            let Eyeimage = UIImage(systemName: "eye.fill")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
            Togglebutton.setBackgroundImage(Eyeimage, for: UIControl.State.normal)
            passwordText.isSecureTextEntry = false
        }else{
            let Eyeimage = UIImage(systemName: "eye.slash.fill")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
            Togglebutton.setBackgroundImage(Eyeimage, for: UIControl.State.normal)
            passwordText.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    
    @IBAction func loginUser(sender: AnyObject){
        passwordText.delegate = self
        
        let Home = HomeViewController()
        getLogin(username: emailText.text!, password: passwordText.text! )

        if jsonString.contains("errors") == true {
            print ("Something Went Wrong")
        }
        else{
            Home.modalPresentationStyle = .fullScreen
            Home.isModalInPresentation = true
            present(Home, animated: true, completion: nil)
        }
        
    }
    
   
    
}

@nonobjc extension UIViewController {
    func added(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func removed() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}







    
