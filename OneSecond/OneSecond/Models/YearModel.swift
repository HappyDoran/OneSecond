//
//  YearModel.swift
//  OneSecond
//
//  Created by Doran on 6/18/24.
//

import Foundation
import SwiftUI

struct YearModel: Identifiable {
    let id = UUID()
    let year: Int
    let imageSource: String
}

let yearData: [YearModel] = (2000...2023).map { year in
    YearModel(year: year, imageSource: "PlayList_Thumbnail_\(year)")
}
