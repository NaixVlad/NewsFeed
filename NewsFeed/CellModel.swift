//
//  CellModel.swift
//  NewsFeed
//
//  Created by Vladislav Andreev on 01.11.2017.
//  Copyright © 2017 Vladislav Andreev. All rights reserved.
//

import Foundation

//Cell model description

enum StyleType: String {
    case style1 = "type_style1"
    case style2 = "type_style2"
    case style3 = "type_style3"
    case style4 = "type_style4"
    case style5 = "type_style5"
    case row = "type_row"
}

struct CellModel {
    
    let type: StyleType?
    let image: String?
    let title: String?
    let data: [CellModelData]?
    
}

extension CellModel {
    private enum Keys: String, SerializationKey {
        case type
        case image
        case title
        case data
    }
    
    init(serialization: Serialization) {
        
        type = StyleType(rawValue: serialization.value(forKey: Keys.type)!)
        image = serialization.value(forKey: Keys.image)
        title = serialization.value(forKey: Keys.title)
        data = serialization.value(forKey: Keys.data)
        
    }
}

//Cell model data description

struct CellModelData {
    let section: String?
    let description: String?
    let content: [Content]?
}

extension CellModelData {
    private enum Keys: String, SerializationKey {
        case section
        case description
        case content
    }
    
    init(serialization: Serialization) {
        
        section = serialization.value(forKey: Keys.section)!
        description = serialization.value(forKey: Keys.description)!
        content = serialization.value(forKey: Keys.content)!
        
    }
}

//Content description

struct Content {
    let type: StyleType?
    let title: String?
    let image: String?
   
}

extension Content {
    private enum Keys: String, SerializationKey {
        case type
        case title
        case image
    }
    
    init(serialization: Serialization) {
        
        type = StyleType(rawValue:serialization.value(forKey: Keys.type)!)
        title = serialization.value(forKey: Keys.title)
        image = serialization.value(forKey: Keys.image)
        
    }
}


