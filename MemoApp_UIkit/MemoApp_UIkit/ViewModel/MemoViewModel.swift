//
//  MemoViewModel.swift
//  MemoApp_UIkit
//
//  Created by 박성민 on 2023/03/17.
//

import Foundation
import RealmSwift

class MemoViewModel: NSObject {
    
    static var shared = MemoViewModel()
    
    var memos = [Memo]()
    
    typealias completionHandler = () -> Void
    
    let realm = try! Realm()
    
    func addMemo(memo: Memo, completion: completionHandler) {
        
        self.realm.beginWrite()
        
        self.realm.add(memo)
        
        try! self.realm.commitWrite()
        
        print("Memo saved!")
        
        completion()
    }
    
    func loadMemos(completion: completionHandler) {
        self.realm.beginWrite()
        
        let savedMemos = self.realm.objects(Memo.self)
        self.memos.removeAll()
        self.memos.append(contentsOf: savedMemos)
        
        try! self.realm.commitWrite()
        
        completion()

    }
    
    func editMemo(memo: Memo, updatedMemo: Memo, completion: completionHandler) {
        
        self.realm.beginWrite()
        
        self.realm.delete(memo)
        
        self.realm.add(updatedMemo)
        
        try! self.realm.commitWrite()
        
        completion()

    }
    
    func deleteMemo(memo: Memo, memoIndex: Int, completion: completionHandler) {
        
        self.realm.beginWrite()
        
        self.realm.delete(memo)
                
        try! self.realm.commitWrite()
        
        memos.remove(at: memoIndex)
        
        completion()
    }
}
