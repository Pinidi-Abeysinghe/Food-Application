//
//  SignUpViewController.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-01-23.
//

import UIKit
class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var iconClick = true
    var token1: [[String:Any]] = []
    
    override func viewDidLoad() {
        iconClick = true
    super.viewDidLoad()
    // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black
        view.addSubview(formView)
        view.addSubview(DiamondView)
        //view.addSubview(frameView)
        //setupFrame()
        view.addSubview(profileView)
        setupProfilePic()
        view.addSubview(secondProfileView)
        setupSecondProfilePic()
        view.addSubview(UsernameText)
        setupUsernameText()
        view.addSubview(emailText)
        setupEmailText()
        view.addSubview(passwordText)
        setupPasswordText()
        setupToggleBtn()
        Togglebutton.addTarget(self, action: #selector(self.passwordToggle(sender:)), for: .touchUpInside)
        view.addSubview(SignupButton)
        setupSignupButton()
        view.addSubview(TitleView)
        setupTitleView()
        view.addSubview(SubTitleView)
        setupSubTitleView()
        view.addSubview(SignUpView)
        setupSignUpDescription()
        view.addSubview(LoginButton)
        setupLoginDBtn()
        SignupButton.addTarget(self, action: #selector(self.SignupUser(sender:)), for: .touchUpInside)
        self.view = view
        passwordText.delegate = self
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
        label.text = "Get Started"
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:36)
        label.textColor = .systemGray4
        return label
               
    }()
    
    let SubTitleView: UILabel = {
        let label = UILabel()
        label.text = "Start your journey here..."
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        label.textColor = .systemGray5
        return label
               
    }()
    
    let profileView: UIImageView = {
        let imageView = UIImageView()
          //imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
          imageView.contentMode = . scaleAspectFill
          if let newImage = UIImage(named: "SigninPic") {
             imageView.image = newImage
          }
        
        
        return imageView;
    }()
    
    let secondProfileView: UIImageView = {
        let imageView = UIImageView()
          //imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
          imageView.contentMode = . scaleAspectFill
          if let newImage = UIImage(named: "foodPlate") {
             imageView.image = newImage
          }
        
        
        return imageView;
    }()
    
//    let frameView: UIImageView = {
//        let image = UIImage(systemName: "circle.circle")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
//
//        let formView:UIImageView = UIImageView()
//           formView.contentMode = UIView.ContentMode.scaleAspectFit
//           formView.frame.size.width = 300
//           formView.frame.size.height = 300
//                //formView.center = self.view.center
//
//           formView.image = image
//           //formView.frame = CGRect(x: -25, y: 10, width: 400, height: 600)
//        return formView
//    }()
    
    let UsernameText: UITextField = {
        let username = UITextField()
        let leftImgView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 40, height: 40))
        username.layer.cornerRadius = 40
        username.clipsToBounds = true
        username.attributedPlaceholder =  NSAttributedString(string: "Username",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.9)])
        username.textColor = UIColor.white
        
                let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 130.0, height: 130.0))
                       username.leftView = leftView
                       username.leftViewMode = .always
        
        let image = UIImage(systemName: "person.fill")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 50
           formView.frame.size.height = 50
                //formView.center = self.view.center
                
           formView.image = image
           formView.frame = CGRect(x: 20, y: 14, width: 30, height: 30)
        let leftView1 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0))
        leftView1.addSubview(formView)
        username.leftView = leftView1
        username.leftViewMode = .always
           
//        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
//                email.leftView = leftView
//                email.leftViewMode = .always
        username.layer.borderColor = UIColor.white.cgColor
        username.layer.borderWidth = 1
        username.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return username
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
    
    let SignupButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemYellow
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 20)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    let SignUpView: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        label.textColor = .systemGray4
        return label
               
    }()
    
    let LoginButton: UIButton = {
        let LoginBtn = UIButton(type: .system)
        LoginBtn.backgroundColor = .systemYellow.withAlphaComponent(0.0)
        LoginBtn.setTitle("Log In", for: .normal)
        LoginBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        LoginBtn.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 14)
        LoginBtn.setTitleColor(UIColor.systemYellow, for: .normal)
        return LoginBtn
    }()
    
    func setupProfilePic(){
        profileView.layer.cornerRadius = 135
        profileView.clipsToBounds = true
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.widthAnchor.constraint(equalToConstant: 270).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        profileView.topAnchor.constraint(equalTo: view.topAnchor,constant: -5).isActive = true
        profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 70).isActive = true
    }
    
    func setupSecondProfilePic(){
        secondProfileView.layer.cornerRadius = 125
        secondProfileView.clipsToBounds = true
        secondProfileView.translatesAutoresizingMaskIntoConstraints = false
        secondProfileView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        secondProfileView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        secondProfileView.topAnchor.constraint(equalTo: view.topAnchor,constant: 40).isActive = true
        secondProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -240).isActive = true
    }
    
    func setupUsernameText(){
        UsernameText.translatesAutoresizingMaskIntoConstraints = false
        UsernameText.widthAnchor.constraint(equalToConstant: 300).isActive = true
        UsernameText.heightAnchor.constraint(equalToConstant: 70).isActive = true
        UsernameText.topAnchor.constraint(equalTo: secondProfileView.topAnchor,constant: 300).isActive = true
        UsernameText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupEmailText(){
        emailText.translatesAutoresizingMaskIntoConstraints = false
        emailText.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailText.heightAnchor.constraint(equalToConstant: 70).isActive = true
        emailText.topAnchor.constraint(equalTo: secondProfileView.topAnchor,constant: 380).isActive = true
        emailText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupPasswordText(){
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordText.heightAnchor.constraint(equalToConstant: 70).isActive = true
        passwordText.topAnchor.constraint(equalTo: emailText.topAnchor,constant: 80).isActive = true
        passwordText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupSignupButton(){
        SignupButton.layer.cornerRadius = 25
        SignupButton.clipsToBounds = true
        SignupButton.translatesAutoresizingMaskIntoConstraints = false
        SignupButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        SignupButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        SignupButton.topAnchor.constraint(equalTo: passwordText.topAnchor,constant: 80).isActive = true
        SignupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 40).isActive = true
    }
    
    func setupSignUpDescription(){
        SignUpView.translatesAutoresizingMaskIntoConstraints = false
        SignUpView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        SignUpView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        SignUpView.topAnchor.constraint(equalTo: SignupButton.topAnchor,constant: 60).isActive = true
        SignUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupLoginDBtn(){
        LoginButton.translatesAutoresizingMaskIntoConstraints = false
        LoginButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        LoginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        LoginButton.topAnchor.constraint(equalTo: SignupButton.topAnchor,constant: 60).isActive = true
        LoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -45).isActive = true
    }
    
    func setupTitleView(){
        TitleView.translatesAutoresizingMaskIntoConstraints = false
        TitleView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        TitleView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        TitleView.topAnchor.constraint(equalTo: secondProfileView.topAnchor,constant: 228).isActive = true
        TitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupSubTitleView(){
        SubTitleView.translatesAutoresizingMaskIntoConstraints = false
        SubTitleView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        SubTitleView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        SubTitleView.topAnchor.constraint(equalTo: TitleView.topAnchor,constant: 30).isActive = true
        SubTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 40).isActive = true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
            print(updatedText)
            return true
        }
    
     @IBAction func navigateSignUp(sender: UIButton!){
        let mainView = ViewController()
        mainView.segmentedController.selectedSegmentIndex = 1
        print("second view")
    }
    
    @IBAction func SignupUser(sender: UIButton!){
        let Home = HomeViewController()
        getEnroll(email: emailText.text!, username: UsernameText.text!, password: passwordText.text! )

        if jsonString.contains("errors") == true {
            print ("Something Went Wrong")
        }
        else{
            Home.modalPresentationStyle = .fullScreen
            Home.isModalInPresentation = true
            present(Home, animated: true, completion: nil)
        }
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
    


    
}

    

