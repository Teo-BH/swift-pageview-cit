//
//  PageModel.swift
//  DojoGianSwift
//
//  Created by Teobaldo Mauro de Moura on 6/28/16.
//  Copyright © 2016 Teobaldo Mauro de Moura. All rights reserved.
//

import Foundation

struct Page {
    
    let title : String
    let imageName : String
    let description : String
    private let titleKey = "title"
    private let descriptionKey = "description"
    private let imageKey = "image"
    
    
    init(withDictionary dict : Dictionary<String, AnyObject>) {
        title = dict[titleKey] as! String
        imageName = dict[imageKey] as! String
        description = dict[descriptionKey] as! String
    }
    
}