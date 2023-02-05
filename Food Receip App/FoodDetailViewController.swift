//
//  FoodDetailViewController.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-02-04.
//

import UIKit
  
  
class FoodDetailViewController: UIViewController {
        
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
        
//        var currentPage = 0
//        var iconClick = true
        
        
        override func viewDidLoad() {
            
            super.viewDidLoad()

            view.addSubview(containerView)
            containerView.addSubview(scrollView)
            scrollView.showsVerticalScrollIndicator = false
            scrollView.isScrollEnabled = false
            view.addSubview(imgeView)
            setupImge()
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
            view.addSubview(diamond4View)
            setupTriangle()
            view.addSubview(VideoLink)
            setupLinkLabel()
            view.addSubview(LinkLabel)
            setupLinkDes()
            view.addSubview(DetailsLabel)
            setupDetailsLabel()
            view.addSubview(DetailsDes)
            setupDetailsDes()
            view.addSubview(favButton)
            setupFavBtn()
            view.addSubview(backButton)
            setupBackBtn()
            
            backButton.addTarget(self, action: #selector(self.loadPreviousView(_:)), for: .touchUpInside)
            
        }
        
    var imgeView: UIImageView = {
        var image = UIImage(named: "HomeSlide1")
        
        let formView:UIImageView = UIImageView()
        //formView.frame = CGRect(x: 0, y: 0, width: 350, height: 200)
           formView.image = image
        return formView
    }()
        
        let HomeTitle: UILabel = {
            let label = UILabel()
            label.text = "Menu recipe"
            label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:36)
            //label.font = UIFont.Weight.bold
            label.numberOfLines = 2
            label.lineBreakMode = .byWordWrapping
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
        
    let diamond4View: UIImageView = {
        let image = UIImage(systemName: "diamond")?.withTintColor(.systemGray3.withAlphaComponent(0.5), renderingMode: .alwaysOriginal)
        
        let formView:UIImageView = UIImageView()
           formView.contentMode = UIView.ContentMode.scaleAspectFit
           formView.frame.size.width = 500
           formView.frame.size.height = 520
                
           formView.image = image
        return formView
    }()
    
    let VideoLink: UILabel = {
        let label = UILabel()
        label.text = "YouTube Channel: "
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        //label.font = UIFont.Weight.bold
        label.backgroundColor = .black.withAlphaComponent(0.4)
        label.textColor = .systemGray4
        label.textAlignment = .left
        return label
               
    }()
    
    let LinkLabel: UILabel = {
        let label = UILabel()
        label.text = "YouTube Channel: "
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        //label.font = UIFont.Weight.bold
        label.backgroundColor = .black.withAlphaComponent(0.4)
        label.textColor = .systemGray4
        label.textAlignment = .center
        return label
               
    }()
    
    let DetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Details: "
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        //label.font = UIFont.Weight.bold
        label.backgroundColor = .black.withAlphaComponent(0.4)
        label.textColor = .systemGray4
        label.textAlignment = .left
        return label
               
    }()
    
    let DetailsDes: UILabel = {
        let label = UILabel()
        label.text = "Details: "
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        //label.font = UIFont.Weight.bold
        label.backgroundColor = .black.withAlphaComponent(0.4)
        label.textColor = .systemGray4
        label.textAlignment = .left
        label.numberOfLines = 10
        return label
               
    }()
    
    let favButton: UIButton = {
        let FavBtn = UIButton(type: .system)
        let image = UIImageView(image: UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        FavBtn.backgroundColor = .systemYellow.withAlphaComponent(0.8)
        FavBtn.setTitle("Add To Favourites", for: .normal)
        FavBtn.setTitleColor(UIColor.black, for: .normal)
        FavBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        image.frame = CGRect(x: 25, y: 0, width: 50, height: 50)
        FavBtn.addSubview(image)
        
        return FavBtn
    }()
    
    let backButton: UIButton = {
        let FavBtn = UIButton(type: .system)
        let image = UIImageView(image: UIImage(systemName: "arrow.left")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        FavBtn.backgroundColor = .systemYellow.withAlphaComponent(0.5)
        image.frame = CGRect(x: -2, y: 0, width: 50, height: 50)
        FavBtn.addSubview(image)
        
        return FavBtn
    }()
        
    
    func setupImge(){
        imgeView.translatesAutoresizingMaskIntoConstraints = false
        imgeView.widthAnchor.constraint(equalToConstant: 500).isActive = true
        imgeView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        imgeView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10).isActive = true
        imgeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
    
        func setupTriangle(){
        
            diamond4View.translatesAutoresizingMaskIntoConstraints = false
            diamond4View.widthAnchor.constraint(equalToConstant: 200).isActive = true
            diamond4View.heightAnchor.constraint(equalToConstant: 145).isActive = true
            diamond4View.topAnchor.constraint(equalTo: view.topAnchor, constant: 370).isActive = true
            diamond4View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -280).isActive = true
            
        }
        
        func setupHomeTitle(){
            HomeTitle.translatesAutoresizingMaskIntoConstraints = false
            HomeTitle.widthAnchor.constraint(equalToConstant: 500).isActive = true
            HomeTitle.heightAnchor.constraint(equalToConstant: 220).isActive = true
            HomeTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 290).isActive = true
            HomeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //HomeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        }
    
        func setupLinkLabel(){
        
            VideoLink.translatesAutoresizingMaskIntoConstraints = false
            VideoLink.widthAnchor.constraint(equalToConstant: 140).isActive = true
            VideoLink.heightAnchor.constraint(equalToConstant: 60).isActive = true
            VideoLink.topAnchor.constraint(equalTo: view.topAnchor, constant: 440).isActive = true
            VideoLink.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -230).isActive = true
            
        }
       
    func setupLinkDes(){
        LinkLabel.translatesAutoresizingMaskIntoConstraints = false
        LinkLabel.widthAnchor.constraint(equalToConstant: 210).isActive = true
        LinkLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        LinkLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 440).isActive = true
        LinkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
       func setupDetailsLabel(){
        
           DetailsLabel.translatesAutoresizingMaskIntoConstraints = false
           DetailsLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
           DetailsLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
           DetailsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 520).isActive = true
           DetailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -230).isActive = true
           
        }
    
       func setupDetailsDes(){
        
           DetailsDes.translatesAutoresizingMaskIntoConstraints = false
           DetailsDes.widthAnchor.constraint(equalToConstant: 220).isActive = true
           DetailsDes.heightAnchor.constraint(equalToConstant: 120).isActive = true
           DetailsDes.topAnchor.constraint(equalTo: view.topAnchor, constant: 520).isActive = true
           DetailsDes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
           
       }
    
    func setupFavBtn(){
     
        favButton.layer.cornerRadius = 20
        favButton.clipsToBounds = true
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        favButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        favButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 690).isActive = true
        favButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func setupBackBtn(){
        backButton.layer.cornerRadius = 20
        backButton.clipsToBounds = true
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 47).isActive = true
        backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -330).isActive = true
    }
        
        @IBAction func loadPreviousView(_ sender: Any){
            self.dismiss(animated: true, completion: nil)
        }
    
}
