//
//  Memo.swift
//  MemoApp_UIkit
//
//  Created by 박성민 on 2023/03/15.
//

import Foundation
import RealmSwift

class Memo: Object, Identifiable {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var createdAt: Date = Date()
}
