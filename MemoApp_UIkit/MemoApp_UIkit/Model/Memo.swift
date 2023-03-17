//
//  Memo.swift
//  MemoApp_UIkit
//
//  Created by 박성민 on 2023/03/17.
//

import Foundation
import RealmSwift

class Memo: Object {
    // dynamic var또는 dynamic func..이 의미하는 바는 아 얘는 Swift런타임말고 Objective-C런타임 쓸게~~~
    // 선언앞에 dynamic 키워드를 붙히면, objc속성이 암시적으로 표시된다고 해요.
    // 그리고 dynamic키워드는 오직 Class의 멤버에만 사용될 수 있어요.
    // 구조체와 열거형은 상속을 지원하지 않죠? 즉!!!!!!!! 런타임이 사용할 필요가 있는 구현을 파악할 필요가 없음을 의미합니다
    // 참고자료: https://zeddios.tistory.com/296
    
    @objc dynamic var content: String = ""
    @objc dynamic var time: Date = Date()
    
    override init() {
        
        super.init()
        
    }
    
    init(content: String, time: Date) {
        self.content = content
        self.time = time
    }
}
