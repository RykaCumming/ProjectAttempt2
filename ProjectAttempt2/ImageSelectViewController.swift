//
//  ImageSelectViewController.swift
//  ProjectAttempt2
//
//  Created by Ryka Cumming on 28/06/2019.
//  Copyright © 2019 Ryka Cumming. All rights reserved.
//

import UIKit

class ImageSelectViewController: UIViewController {
    
    @IBOutlet weak var the_title: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var imgurlstring: String!
    var label: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let img = imgurlstring else {return}
        guard let name = label else {return}
        the_title.text = name
        let url = URL(string: img)
        URLSession.shared.dataTask(with:url!) {(data,response,error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                //Check if the url image is there before trying it? error checking
                self.imageView.image = UIImage(data: data!)
            }
        }.resume()

    }
        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

