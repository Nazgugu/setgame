//
//  STUtil.swift
//  setgam
//
//  Created by Zhe Liu on 7/20/20.
//  Copyright © 2020 Zhe Liu. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

extension Array {
    mutating func removeAndReturnWithItemCount(itemCount: Int) -> [Element] {
        var returnedElements: [Element] = []
        if self.count < itemCount {
            returnedElements = self
            self.removeAll()
        } else {
            returnedElements = Array(self[0..<itemCount])
            self.removeSubrange(0..<itemCount)
        }
        return returnedElements
    }
}

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
