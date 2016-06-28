//
//  ContentViewController.swift
//  DojoGianSwift
//
//  Created by Teobaldo Mauro de Moura on 6/28/16.
//  Copyright © 2016 Teobaldo Mauro de Moura. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifierKey = "contentViewController"
    
    var pageIndex = 0
    var page : Page?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let imageName = self.page?.imageName {
//            imageView.image = UIImage(named: imageName)
//        }
        
        titleLabel.text = self.page?.title
        descriptionLabel.text = self.page?.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
