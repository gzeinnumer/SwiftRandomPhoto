//
//  ViewController.swift
//  SwiftRandomPhoto
//
//  Created by M Fadli Zein on 15/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.contentMode = .scaleAspectFill
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let colors:[UIColor] = [
        .systemPink,
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemBrown
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
    }
    
    @objc func didTabButton(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: (view.bounds.width / 2) - 100,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: 200,
            height: 50
        )
    }
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

