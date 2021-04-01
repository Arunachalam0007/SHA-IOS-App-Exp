//
//  NewsData.swift
//  ShaNewsApp
//
//  Created by ArunSha on 01/04/21.
//

import Foundation

struct NewsData: Codable {
    var articles : [Articles]?
}

struct Articles: Codable {
    var publishedAt : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
    var source : Source?
}

struct Source: Codable {
    var name : String?
}

