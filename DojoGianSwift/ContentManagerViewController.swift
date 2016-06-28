//
//  ContentManagerViewController.swift
//  DojoGianSwift
//
//  Created by Teobaldo Mauro de Moura on 6/28/16.
//  Copyright © 2016 Teobaldo Mauro de Moura. All rights reserved.
//

import UIKit

class ContentManagerViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pages : Array<Page>?
    var indexPage : Int = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        if let path = NSBundle.mainBundle().pathForResource("Benefits", ofType: "plist") {
            let properties = NSArray(contentsOfFile: path) as! Array<Dictionary<String, AnyObject>>
        
            pages = Array<Page>()
            
            for item in properties {
                let page = Page.init(withDictionary: item);
                pages?.append(page)
            }
            
            let arrayContentVC = [self.instantiateViewController(withIndex: 0)]
            self.setViewControllers(arrayContentVC, direction: .Forward, animated: true, completion: nil)
        }
    }
    
    func instantiateViewController(withIndex index: Int) -> ContentViewController{
        let mainStoryBoard  = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle())
        let contentVC = mainStoryBoard.instantiateViewControllerWithIdentifier(ContentViewController.identifierKey) as! ContentViewController
 
        contentVC.page = self.pages![index]
        return contentVC
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if indexPage == 0 {
            return nil
        }
        
        self.indexPage -= 1
        
        return self.instantiateViewController(withIndex: indexPage)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if indexPage == (self.pages?.count)! - 1 { 
            return nil
        }
        
        self.indexPage += 1
        
        return self.instantiateViewController(withIndex: indexPage)
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return (self.pages?.count)!
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
