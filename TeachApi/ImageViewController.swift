//
//  ImageViewController.swift
//  TeachApi
//
//  Created by Артур Петин on 02.05.2021.
//

import UIKit

class ImageviewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        fetchImage()
    }
    


    private func fetchImage() {
        guard let url = URL(string: URLExamples.imageURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }.resume()
    }
}
