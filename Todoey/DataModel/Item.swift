//
//  Item.swift
//  Todoey
//
//  Created by Shankar R N S on 7/19/18.
//  Copyright © 2018 RNS. All rights reserved.
//

import Foundation

class Item : Encodable, Decodable
{
	var title : String = ""
	var done : Bool = false
}

