//
//  ViewController.swift
//  ProjectAttempt2
//
//  Created by Ryka Cumming on 27/06/2019.
//  Copyright © 2019 Ryka Cumming. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var urlstringfirst : String = "https://riverisland.scene7.com/is/image/RiverIsland/"

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list_of_product_entries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let url = URL(string: urlstringfirst+list_of_product_entries[indexPath.row].prodid_+"_main")
        URLSession.shared.dataTask(with:url!) {(data,response,error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: data!)
            }
        }.resume()
        cell.title.text = list_of_product_entries[indexPath.row].name_
        cell.price.text = "£" + list_of_product_entries[indexPath.row].cost_
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = list_of_product_entries[indexPath.row]
        performSegue(withIdentifier: "viewimagesegue", sender: product)
        print(indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let product = sender as! Entry//TODO maybe error here (as! Entry)
        if segue.identifier == "viewimagesegue" {
            if let viewcontroller = segue.destination as? ImageSelectViewController {
                viewcontroller.imgurlstring = urlstringfirst + product.prodid_ + "_main"
                viewcontroller.label = product.name_
                //this method involves downloading the image again when you select it
                // sending a value from this viewcontroller to the next (the image details)
            }
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewFlowLayout = UICollectionViewFlowLayout()//TODO Inspect - why no () in tutorial. Listen to reason why he made this
    var images : [String] = ["729489_main","735366_main","739451_main","799988_main"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print(list_of_product_entries.count)
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
        let numberOfItemsPerRow : CGFloat = 2
        let lineSpacing : CGFloat = 10
        let interItemSpacing : CGFloat = 5
        print(collectionView.frame.width)
        print(UIScreen.main.bounds.width)
        let width = UIScreen.main.bounds.width/2.0 - interItemSpacing
        let height = width * 1.4
        collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = lineSpacing
        collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
        collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

