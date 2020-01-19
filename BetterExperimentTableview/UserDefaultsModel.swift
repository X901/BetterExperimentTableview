////
//UserDefaultsModel.swift
//BetterExperimentTableview
//
//Created by Basel Baragabah on 16/01/2020.
//Copyright © 2020 Basel Baragabah. All rights reserved.
//

import Foundation

struct UserDefaultsModel {

    private static let scrollingIndexRowKey = "scrollingIndexRowKey"

    static var getscrollingIndexRow = {
            UserDefaults.standard.value(forKey: scrollingIndexRowKey) as? Int
        }
       
       static var setscrollingIndexRow = { (scrollingIndexRow: Int) in
           UserDefaults.standard.set(scrollingIndexRow, forKey: scrollingIndexRowKey)
       }
}
