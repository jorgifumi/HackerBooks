//
//  HackerBooksDetailViewController.swift
//  HackerBooks
//
//  Created by Jorge Miguel Lucena Pino on 12/12/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import UIKit

class HackerBooksDetailViewController: UIViewController, UINavigationControllerDelegate, HackerBooksTableViewControllerDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var authors: UILabel!
    @IBOutlet weak var tags: UILabel!
    @IBAction func favSwitch(sender: AnyObject) {
        
        // Cambia el estado de favorito del libro mostrado
        if model!.isFavorite {
            model?.isFavorite = false
        }else{
            model?.isFavorite = true
        }
    }
    
    var model : KCBook?
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.

        //photo = model?.image
        authors.text = model?.authors?.joinWithSeparator(", ") ?? " "
        tags.text = model?.tags?.map({$0.tagName}).joinWithSeparator(", ")
        
        // TODO: Cargar estado del interruptor
        // propiedad = model.isFavorite
        
//        if let detail = self.detailItem {
//            if let label = self.detailDescriptionLabel {
//                label.text = detail.description
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Delegate
    
    func hackerBooksTableViewController(tableview: HackerBooksTableViewController, didSelectedBook aBook: KCBook){
        
        model = aBook
        self.title = aBook.title
        self.configureView()
        
    }


}

