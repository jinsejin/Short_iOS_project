//
//  FontSystem.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/24.
//
import UIKit

extension UIFont {
    //예시
    static func header(size fontSize: CGFloat = 40.0) -> UIFont {
        let familyName = "Pretendard"
        let weightString = "SemiBold"
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
}
