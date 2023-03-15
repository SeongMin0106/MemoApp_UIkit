//
//  HomeViewController.swift
//  MemoApp_UIkit
//
//  Created by 박성민 on 2023/03/15.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    static var memos: [Memo] = []
    
    @IBOutlet weak var addMemoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    @IBAction func addMemoButton(_ sender: Any) {
        addData(title: "하이", content: "헬로우")
    }
    
    
    //MARK: - Realm
    // 데이터 읽기
    func fetchData() {
        
        guard let dbRef = try? Realm() else { return }
        
        let results = dbRef.objects(Memo.self)
        
        HomeViewController.memos = results.compactMap({ memo -> Memo? in
            return memo
        })
    }
    // 데이터 추가
    func addData(title: String, content: String) {
        let memo = Memo()
        memo.id = UUID().uuidString
        memo.title = title
        memo.content = content
        memo.createdAt = Date.now
        
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write {
            
            dbRef.add(memo)
            
            fetchData()
        }
    }
    
    // 데이터 삭제
    func deleteData(memo: Memo) {
        
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write {
            
            dbRef.delete(memo)
            
            fetchData()
        }
    }
    
    // 데이터 업데이트
    func updateData(memo: Memo, title: String, content: String) {
        
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write {
            
            memo.title = title
            memo.content = content
            
            fetchData()
        }
    }
    

}

extension HomeViewController: UICollectionViewDataSource {
    
    // 몇개의 색션으로 나뉘는지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeViewController.memos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //재사용 가능한 셀을 가져오겠다.
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "MemoListCollectionViewCell", for: indexPath) as? MemoListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let memo = HomeViewController.memos[indexPath.item]
        cell.configure(memo)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //너비. == collectionView와 같음
        // 높이는 80
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
