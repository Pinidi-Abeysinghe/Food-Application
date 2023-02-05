//
//  CardCollectionViewCell.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-02-03.
//

import Foundation
import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    var status: Bool = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        status =  false
        // add the button and label as subviews
        contentView.addSubview(imgeView)
        setupImg()
        contentView.addSubview(favButton)
        setupFav()
        contentView.addSubview(TitleView)
        setupTitle()
        //contentView.addSubview(idView)
        
        //favButton.addTarget(self, action: #selector(AddFavourite(sender:)), for: .touchUpInside)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let favButton: UIButton = {
        let FavBtn = UIButton(type: .system)
        //let image = UIImageView(image: UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal))
        FavBtn.backgroundColor = .systemGray4.withAlphaComponent(0.8)
        FavBtn.setImage( UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        //FavBtn.addSubview(image)
        
        return FavBtn
    }()
    
    var imgeView: UIImageView = {
        var image = UIImage(named: "HomeSlide1")
        
        let formView:UIImageView = UIImageView()
        //formView.frame = CGRect(x: 0, y: 0, width: 350, height: 200)
           formView.image = image
        return formView
    }()
    
    let TitleView: UILabel = {
        let label = UILabel()
        label.text = "I want to eat my breakfast"
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        return label
               
    }()
    
    let idView: UILabel = {
        let label = UILabel()
        label.text = "I want to eat my breakfast"
        label.font = UIFont(name:"Hiragino Maru Gothic ProN W4",size:14)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .systemGray4.withAlphaComponent(0.5)
        return label
               
    }()
    
    func setupImg(){
        imgeView.translatesAutoresizingMaskIntoConstraints = false
        imgeView.widthAnchor.constraint(equalToConstant: 370).isActive = true
        imgeView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imgeView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imgeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
    }
    
    func setupFav(){
        favButton.layer.cornerRadius = 20
        favButton.clipsToBounds = true
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        favButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        favButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        favButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    func setupTitle(){
        TitleView.translatesAutoresizingMaskIntoConstraints = false
        TitleView.widthAnchor.constraint(equalToConstant: 370).isActive = true
        TitleView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        TitleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 213).isActive = true
        TitleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1).isActive = true
    }

    @IBAction func AddFavourite(sender: UIButton){
        
        if status == false {
            
            favButton.setImage( UIImage(systemName: "heart.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
            if favButton.tag % 5 == 0 {
                UpdateBreakfast(number: favButton.tag/5)
                parameters1 = "{\r\n  \r\n \"Like\": true\r\n}"
            }else if favButton.tag % 3 == 0 {
                UpdateLunch(number: favButton.tag/3)
                parameters2 = "{\r\n  \r\n \"Like\": true\r\n}"
            }else if favButton.tag % 8 == 0 {
                UpdateDinner(number: favButton.tag/8)
                parameters3 = "{\r\n  \r\n \"Like\": true\r\n}"
            }
        }else{
            favButton.setImage( UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
            if favButton.tag % 5 == 0 {
                UpdateUnlikeBreakfast(number: favButton.tag/5)
            }else if favButton.tag % 3 == 0 {
                UpdateUnlikeLunch(number: favButton.tag/3)
            }else if favButton.tag % 8 == 0 {
                UpdateUnlikeDinner(number: favButton.tag/8)
            }
            
        }
        //let Breakfasts = BreakfastViewController()
       status = !status
        print("Favourite Event Triggered \(favButton.tag)")

    }
}
