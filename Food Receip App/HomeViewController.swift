//
//  HomeViewController.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-01-27.
//

import UIKit

class HomeViewController: UIViewController {
    
    let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    let scrollMenuView = UIScrollView()//frame: CGRect(x: 0, y: 250, width: 400, height: 400))
    var imageViews = [UIImageView]()
    let stackView1 = UIStackView(frame: CGRect(x: 170, y: 305, width: 33, height: 10))
    let stackView2 = UIStackView(frame: CGRect(x: 170, y: 305, width: 33, height: 10))
    let stackView3 = UIStackView(frame: CGRect(x: 170, y: 305, width: 33, height: 10))
    let image1 = UIImageView(image: UIImage(systemName: "circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal))
    let image2 = UIImageView(image: UIImage(systemName: "circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal))
    let image3 = UIImageView(image: UIImage(systemName: "circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal))
    let images = [UIImage(named: "HomeSlide1"), UIImage(named: "HomeSlide2"), UIImage(named: "HomeSlide3")]
    let text = ["Health Inspired Flavors Appeal to Wellness","Dietiticians Dish on Trends to Watch in 2023","A Healthy Outside Starts From The Inside"]
    
    var currentPage = 0
    var iconClick = true
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        iconClick =  true
        view.addSubview(containerView)
        containerView.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = false
        view.addSubview(menuButton)
        setupMenuBtn()
        view.addSubview(stackView1)
        view.addSubview(frameView)
        setupFrame()
        view.addSubview(diamondView)
        setupDiamond()
        view.addSubview(diamond2View)
        setupSecondDiamond()
        view.addSubview(diamond3View)
        setupThirdDiamond()
        view.addSubview(HomeTitle)
        setupHomeTitle()
        setupStack(response: 0)
        view.addSubview(breakfastButton)
        setupBreakfastBtn()
        view.addSubview(lunchButton)
        setupLunchBtn()
        view.addSubview(dinnerButton)
        setupDinnerBtn()
        menuView.addSubview(scrollMenuView)
        setupMenuScroll()
        scrollMenuView.addSubview(homeButton)
        scrollMenuView.addSubview(operationButton)
        scrollMenuView.addSubview(favButton)
        scrollMenuView.addSubview(logoutButton)
        setupHomeButton()
        setupOperationButton()
        setupFavButton()
        setupLogButton()
        
        let timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [self] timer in
            currentPage = currentPage < images.count - 1 ? currentPage + 1 : 0
                let offset = CGPoint(x: CGFloat(currentPage) * scrollView.frame.width, y: 0)
                scrollView.setContentOffset(offset, animated: true)
            TitleView.text = text[currentPage]
            setupStack(response: currentPage)
        }
        // Do any additional setup after loading the view.
        add()
        RunLoop.current.add(timer, forMode: .common)
        menuButton.addTarget(self, action: #selector(self.onClickMenu(_:)), for: .touchUpInside)
        breakfastButton.addTarget(self, action: #selector(self.loadBreakfastView(_:)), for: .touchUpInside)
        lunchButton.addTarget(self, action: #selector(self.loadLunchView(_:)), for: .touchUpInside)
        dinnerButton.addTarget(self, action: #selector(self.loadDinnerView(_:)), for: .touchUpInside)
        favButton.addTarget(self, action: #selector(self.loadFavouritesView(_:)), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(loadLogoutView(_:)), for: .touchUpInside)
        homeButton.addTarget(self, action: #selector(loadHomeView(_:)), for: .touchUpInside)
    }
    
    
   
    let TitleView: UILabel = {
        let label = UILabel()
        label.text = "Health Inspired Flavors Appeal to Wellness"
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .systemYellow.withAlphaComponent(0.5)
        return label
               
    }()
    
    let HomeTitle: UILabel = {
        let label = UILabel()
        label.text = "Menu recipe"
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:36)
        //label.font = UIFont.Weight.bold
        label.textColor = .systemGray4
        label.textAlignment = .center
        return label
               
    }()
    
    let frameView: UIImageView = {
        let image = UIImage(systemName: "rectangle.portrait.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 500
           formView.frame.size.height = 1600
                
           formView.image = image
        return formView
    }()
    
    let diamondView: UIImageView = {
        let image = UIImage(systemName: "diamond")?.withTintColor(.systemGray3.withAlphaComponent(0.3), renderingMode: .alwaysOriginal)
        
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 460
           formView.frame.size.height = 500
                
           formView.image = image
        return formView
    }()
    
    let diamond2View: UIImageView = {
        let image = UIImage(systemName: "diamond")?.withTintColor(.systemGray3.withAlphaComponent(0.5), renderingMode: .alwaysOriginal)
        
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 460
           formView.frame.size.height = 500
                
           formView.image = image
        return formView
    }()
    
    let diamond3View: UIImageView = {
        let image = UIImage(systemName: "diamond")?.withTintColor(.systemGray3.withAlphaComponent(0.2), renderingMode: .alwaysOriginal)
        
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 460
           formView.frame.size.height = 500
                
           formView.image = image
        return formView
    }()
    
    let breakfastButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImageView(image: UIImage(named: "waffle")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        let image2 = UIImageView(image: UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal))
    
        
        button.backgroundColor = .systemYellow.withAlphaComponent(0.7)
        button.setTitle("  Breakfast", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 24)
        //button.titleLabel?.textColor = .systemRed
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.black, for: .normal)
        button.addSubview(image)
        button.addSubview(image2)
        image2.frame = CGRect(x: 300, y: 20, width: 60, height: 60)
        image.frame = CGRect(x: 15, y: 20, width: 60, height: 60)


        
        return button
    }()
    
    let lunchButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImageView(image: UIImage(named: "rice")?.withRenderingMode(.alwaysOriginal))
        let image2 = UIImageView(image: UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal))
    
        
        button.backgroundColor = .systemYellow.withAlphaComponent(0.7)
        button.setTitle("Lunch", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 24)
        //button.titleLabel?.textColor = .systemRed
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.black, for: .normal)
        button.addSubview(image)
        button.addSubview(image2)
        image2.frame = CGRect(x: 300, y: 20, width: 60, height: 60)
        image.frame = CGRect(x: 15, y: 20, width: 60, height: 60)
        
        return button
    }()
    
    let dinnerButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImageView(image: UIImage(named: "pizza")?.withRenderingMode(.alwaysOriginal))
        let image2 = UIImageView(image: UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal))
    
        
        button.backgroundColor = .systemYellow.withAlphaComponent(0.7)
        button.setTitle("Dinner", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 24)
        //button.titleLabel?.textColor = .systemRed
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.black, for: .normal)
        button.addSubview(image)
        button.addSubview(image2)
        image2.frame = CGRect(x: 300, y: 20, width: 60, height: 60)
        image.frame = CGRect(x: 15, y: 20, width: 60, height: 60)
        
        return button
    }()
    
    let menuButton: UIButton = {
        let button = UIButton(type: .system)
        let image2 =  UIImage(named: "addMenu")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
    
        button.backgroundColor = .black.withAlphaComponent(0.5)
        button.setBackgroundImage(image2, for:UIControl.State.normal)
        
        return button
    }()
    
    let homeButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImageView(image: UIImage(systemName: "house")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal))
    
        
        //button.backgroundColor = .systemGray4.withAlphaComponent(1.0)
        button.setTitle("Home", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 24)
        //button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.systemGray4, for: .normal)
        button.addSubview(image)
        image.frame = CGRect(x: 15, y: 20, width: 50, height: 50)
        
        return button
    }()
    
    let operationButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImageView(image: UIImage(systemName: "pencil")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal))
    
        
        //button.backgroundColor = .systemGray4.withAlphaComponent(1.0)
        button.setTitle("Operations", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 24)
        //button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.systemGray4, for: .normal)
        button.addSubview(image)
        image.frame = CGRect(x: 15, y: 20, width: 50, height: 50)
        
        return button
    }()
    
    let favButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImageView(image: UIImage(systemName: "heart")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal))
    
        
        //button.backgroundColor = .systemGray4.withAlphaComponent(1.0)
        button.setTitle("Favourites", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 24)
        //button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.systemGray4, for: .normal)
        button.addSubview(image)
        image.frame = CGRect(x: 15, y: 20, width: 50, height: 50)
        
        return button
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImageView(image: UIImage(systemName: "power")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal))
    
        
        button.setTitle("Log out", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.titleLabel?.font = UIFont(name: "Hiragino Maru Gothic ProN W4", size: 24)
        //button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.systemGray4, for: .normal)
        button.addSubview(image)
        image.frame = CGRect(x: 15, y: 20, width: 50, height: 50)
        
        return button
    }()
    
    let menuView: UIView = {
        let menuNav  = UIView()
        
        menuNav.backgroundColor = .black.withAlphaComponent(0.6)
        
        return menuNav
    }()
    
    func add(){

        for i in 0..<images.count {
            let imageView = UIImageView(image: images[i])
            imageView.frame = CGRect(x: CGFloat(i) * scrollView.frame.width, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            scrollView.addSubview(imageView)
            imageViews.append(imageView)
                    }


        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(images.count), height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
    }
    
    func setupStack(response: Int){
        stackView1.axis = .horizontal
        stackView1.alignment = .fill
        stackView1.distribution = .fillEqually
        
        stackView2.axis = .horizontal
        stackView2.alignment = .fill
        stackView2.distribution = .fillEqually
        
        stackView3.axis = .horizontal
        stackView3.alignment = .fill
        stackView3.distribution = .fillEqually
        
       
        
        if response == 0{
            
            stackView2.removeFromSuperview()
            stackView3.removeFromSuperview()
            stackView1.removeFromSuperview()
           
            
            stackView1.addArrangedSubview(image1)
            stackView1.addArrangedSubview(image2)
            stackView1.addArrangedSubview(image3)
            view.addSubview(stackView1)
        }
       else if response == 1{
           
           stackView1.removeFromSuperview()
           
 
           
           stackView2.addArrangedSubview(image2)
           stackView2.addArrangedSubview(image1)
           stackView2.addArrangedSubview(image3)
           view.addSubview(stackView2)
       } else if response == 2{
           stackView2.removeFromSuperview()
           
           
           stackView3.addArrangedSubview(image2)
           stackView3.addArrangedSubview(image3)
           stackView3.addArrangedSubview(image1)
           view.addSubview(stackView3)
       }
        
    }
    
    func setupTitle(){
        TitleView.translatesAutoresizingMaskIntoConstraints = false
        TitleView.widthAnchor.constraint(equalToConstant: 480).isActive = true
        TitleView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        TitleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 165).isActive = true
        TitleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupFrame(){
        frameView.translatesAutoresizingMaskIntoConstraints = false
        frameView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        frameView.heightAnchor.constraint(equalToConstant: 2000).isActive = true
        frameView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -410).isActive = true
        frameView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupDiamond(){
        diamondView.translatesAutoresizingMaskIntoConstraints = false
        diamondView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        diamondView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        diamondView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 500).isActive = true
        diamondView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupSecondDiamond(){
        diamond2View.translatesAutoresizingMaskIntoConstraints = false
        diamond2View.widthAnchor.constraint(equalToConstant: 200).isActive = true
        diamond2View.heightAnchor.constraint(equalToConstant: 200).isActive = true
        diamond2View.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 465).isActive = true
        diamond2View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 60).isActive = true
    }
    
    func setupThirdDiamond(){
        diamond3View.translatesAutoresizingMaskIntoConstraints = false
        diamond3View.widthAnchor.constraint(equalToConstant: 500).isActive = true
        diamond3View.heightAnchor.constraint(equalToConstant: 440).isActive = true
        diamond3View.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 470).isActive = true
        diamond3View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
    }
    
    func setupHomeTitle(){
        HomeTitle.translatesAutoresizingMaskIntoConstraints = false
        HomeTitle.widthAnchor.constraint(equalToConstant: 500).isActive = true
        HomeTitle.heightAnchor.constraint(equalToConstant: 440).isActive = true
        HomeTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 160).isActive = true
        HomeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //HomeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    func setupBreakfastBtn(){
        breakfastButton.layer.cornerRadius = 20
        breakfastButton.clipsToBounds = true
        breakfastButton.translatesAutoresizingMaskIntoConstraints = false
        breakfastButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        breakfastButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        breakfastButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 440).isActive = true
        breakfastButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupLunchBtn(){
        lunchButton.layer.cornerRadius = 20
        lunchButton.clipsToBounds = true
        lunchButton.translatesAutoresizingMaskIntoConstraints = false
        lunchButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        lunchButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        lunchButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 550).isActive = true
        lunchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupDinnerBtn(){
        dinnerButton.layer.cornerRadius = 20
        dinnerButton.clipsToBounds = true
        dinnerButton.translatesAutoresizingMaskIntoConstraints = false
        dinnerButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        dinnerButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        dinnerButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 660).isActive = true
        dinnerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupMenuBtn(){
        menuButton.layer.cornerRadius = 5
        menuButton.clipsToBounds = true
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -340).isActive = true
    }
    
    func setupMenuNav(){
        let menuHeight: CGFloat = 440
        
        menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          menuView.heightAnchor.constraint(equalToConstant: menuHeight)
        ])

        // menu y constraint off screen
        let menuBottomConstraint = menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: menuHeight)
        menuBottomConstraint.isActive = true
        menuBottomConstraint.constant = 0
         UIView.animate(withDuration: 0.5) {
           self.view.layoutIfNeeded()
         }

        
    }
    
    func setupMenuScroll(){
        menuView.backgroundColor = .black.withAlphaComponent(0.7)
        scrollMenuView.isScrollEnabled = true
        scrollMenuView.frame = CGRect(x: 0, y: 10, width: view.frame.width, height: view.frame.height)
        scrollMenuView.contentSize = CGSize(width: view.frame.width, height: 890)
        scrollMenuView.setContentOffset(CGPoint(x: 0, y: 10), animated: true)
    }
    
    func setupHomeButton(){
        homeButton.layer.cornerRadius = 25
        homeButton.clipsToBounds = true
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        homeButton.topAnchor.constraint(equalTo: scrollMenuView.topAnchor, constant: 10).isActive = true
        homeButton.centerXAnchor.constraint(equalTo: scrollMenuView.centerXAnchor).isActive = true
    }
    
    func setupOperationButton(){
        operationButton.layer.cornerRadius = 25
        operationButton.clipsToBounds = true
        operationButton.translatesAutoresizingMaskIntoConstraints = false
        operationButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        operationButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        operationButton.topAnchor.constraint(equalTo: scrollMenuView.topAnchor, constant: 130).isActive = true
        operationButton.centerXAnchor.constraint(equalTo: scrollMenuView.centerXAnchor).isActive = true
    }
    
    func setupFavButton(){
        favButton.layer.cornerRadius = 25
        favButton.clipsToBounds = true
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        favButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        favButton.topAnchor.constraint(equalTo: scrollMenuView.topAnchor, constant: 250).isActive = true
        favButton.centerXAnchor.constraint(equalTo: scrollMenuView.centerXAnchor).isActive = true
    }
    
    func setupLogButton(){
        logoutButton.layer.cornerRadius = 25
        logoutButton.clipsToBounds = true
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logoutButton.topAnchor.constraint(equalTo: scrollMenuView.topAnchor, constant: 370).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: scrollMenuView.centerXAnchor).isActive = true
    }
    
    @IBAction func onClickMenu(_ sender: Any) {
    // Code for adding transparent view and table view
        
        if iconClick{
            let menuadd =  UIImage(named: "addMenu")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
            menuButton.setBackgroundImage(menuadd, for: UIControl.State.normal)
            menuView.removeFromSuperview()
            
            
        }else{
            let menuremove =  UIImage(named: "menu")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
            menuButton.setBackgroundImage(menuremove, for: UIControl.State.normal)
            view.addSubview(menuView)
            setupMenuNav()
        }
        iconClick = !iconClick
    }
    
    @IBAction func loadBreakfastView(_ sender: Any){
        let breakfastController = BreakfastViewController()
        breakfastController.modalPresentationStyle = .fullScreen
        breakfastController.isModalInPresentation = true
        present(breakfastController, animated: true, completion: nil)
    }
    
    @IBAction func loadLunchView(_ sender: Any){
        let lunchController = LunchViewController()
        lunchController.modalPresentationStyle = .fullScreen
        lunchController.isModalInPresentation = true
        present(lunchController, animated: true, completion: nil)
    }
    
    @IBAction func loadDinnerView(_ sender: Any){
        let dinnerController = DinnerViewController()
        dinnerController.modalPresentationStyle = .fullScreen
        dinnerController.isModalInPresentation = true
        present(dinnerController, animated: true, completion: nil)
    }
    
    @IBAction func loadFavouritesView(_ sender: Any){
        let favouriteController = FavouritesViewController()
        favouriteController.modalPresentationStyle = .fullScreen
        favouriteController.isModalInPresentation = true
        present(favouriteController, animated: true, completion: nil)
    }
    
    @IBAction func loadLogoutView(_ sender: Any){
        let login = ViewController()
        login.modalPresentationStyle = .fullScreen
        login.isModalInPresentation = true
        present(login, animated: true, completion: nil)
    }
    
    @IBAction func loadHomeView(_ sender: Any){
        let homey = HomeViewController()
        homey.modalPresentationStyle = .fullScreen
        homey.isModalInPresentation = true
        present(homey, animated: true, completion: nil)
    }
    
}

