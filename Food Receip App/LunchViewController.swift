//
//  LunchViewController.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-02-04.
//

import UIKit

class LunchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return allLunches.count
    }
  
    var allLunches: [[String:Any]] = []
    var currentPage = 0
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 120, width: 380, height: 800), collectionViewLayout: UICollectionViewFlowLayout())
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            flowLayout.itemSize = CGSize(width: 380, height: 200)
            flowLayout.minimumLineSpacing = 100
            flowLayout.minimumInteritemSpacing = 100
        flowLayout.scrollDirection = .vertical
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .black
        
        //collectionView.frame =

        
        flowLayout.scrollDirection = .vertical
        
        view.addSubview(collectionView)
        view.addSubview(HomeTitle)
        setupHomeTitle()
        view.addSubview(BackNav)
        setupBackBtn()
        BackNav.addTarget(self, action: #selector(self.backNavigation(_:)), for: .touchUpInside)
        
        getAllLunch(completion: )() { (lunchArray) in
            guard let lunchArray = lunchArray else {
                print("No JSONArray received")
                return
            }
            // Use the jsonArray as desired
            self.allLunches = lunchArray
            print(self.allLunches[0])
         
        }
        
    }
    
    let HomeTitle: UILabel = {
        let label = UILabel()
        
        label.text = "  Lunch Recipe"
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:36)
        //label.font = UIFont.Weight.bold
        label.textColor = .systemGray4
        label.textAlignment = .center
        return label
               
    }()
    
    let BackNav: UIButton = {
        let BackBtn = UIButton(type: .system)
        let image = UIImageView(image: UIImage(systemName: "arrow.left")?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal))
        BackBtn.backgroundColor = .systemGray4.withAlphaComponent(0.0)
        image.frame = CGRect(x: 5, y: 5, width: 40, height: 40)
        BackBtn.addSubview(image)
        
        return BackBtn
        
    }()
    
 
    
    func setupHomeTitle(){
        HomeTitle.translatesAutoresizingMaskIntoConstraints = false
        HomeTitle.widthAnchor.constraint(equalToConstant: 380).isActive = true
        HomeTitle.heightAnchor.constraint(equalToConstant: 120).isActive = true
        HomeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        HomeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //HomeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    func setupBackBtn(){
        BackNav.translatesAutoresizingMaskIntoConstraints = false
        BackNav.widthAnchor.constraint(equalToConstant: 50).isActive = true
        BackNav.heightAnchor.constraint(equalToConstant: 40).isActive = true
        BackNav.topAnchor.constraint(equalTo: view.topAnchor, constant: 47).isActive = true
        BackNav.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -330).isActive = true
    }
    
    @IBAction func backNavigation(_ sender: UIButton){
        let homeController = HomeViewController()
        homeController.modalPresentationStyle = .fullScreen
        homeController.isModalInPresentation = true
        present(homeController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CardCollectionViewCell
           
        self.allLunches = lunchArray.filter { $0.keys.contains("Lunch") }
            .map { $0["Lunch"] as! [String : Any] }
        let name = self.allLunches.filter{ $0.keys.contains("Name")}.map{$0["Name"]}
        let image = self.allLunches.filter{ $0.keys.contains("Image")}.map{$0["Image"]}
        let likes = lunchArray.filter { $0.keys.contains("Like") }
            .map { $0["Like"] as! Bool}
        
        cell.TitleView.text = name[indexPath.row] as? String
        

        let imageUrl = URL(string: image[indexPath.row] as! String)!
        let imageData = try! Data(contentsOf: imageUrl)
        cell.imgeView.image = UIImage(data: imageData)
        
        cell.favButton.tag = (indexPath.item + 1) *  3

        var indexes: [Int] = []
        for (index, element) in likes.enumerated() {
                if element == true {
                    indexes.append(index)
                    
                }
            }
        for (_, element) in indexes.enumerated() {
            if element == cell.favButton.tag/3 - 1  {
                cell.favButton.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
                }
            }
        
        cell.favButton.addTarget(cell, action: #selector(cell.AddFavourite(sender:)), for: .touchUpInside)

           return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let FoodDetailVC = FoodDetailViewController()
        self.allLunches = lunchArray.filter { $0.keys.contains("Lunch") }.map { $0["Lunch"] as! [String : Any] }
        let image = self.allLunches.filter{ $0.keys.contains("Image")}.map{$0["Image"]}
        let name = self.allLunches.filter{ $0.keys.contains("Name")}.map{$0["Name"]}
        let link = self.allLunches.filter{ $0.keys.contains("Video")}.map{$0["Video"]}
        let des = self.allLunches.filter{ $0.keys.contains("Details")}.map{$0["Details"]}
//            imageDetailVC.img = imgArr[indexPath.row]
//            imageDetailVC.name = lblArr[indexPath.row]
        FoodDetailVC.modalPresentationStyle = .fullScreen
        FoodDetailVC.isModalInPresentation = true
        present(FoodDetailVC, animated: true, completion: nil)
        
        let imageUrl = URL(string: image[indexPath.row] as! String)!
        let imageData = try! Data(contentsOf: imageUrl)
        FoodDetailVC.imgeView.image = UIImage(data: imageData)
        FoodDetailVC.HomeTitle.text = name[indexPath.row] as? String

        FoodDetailVC.LinkLabel.text = link[indexPath.row] as? String
        FoodDetailVC.DetailsDes.text = des[indexPath.row] as? String
        
        }
    
}


