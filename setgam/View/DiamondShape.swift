//
//  DiamondShape.swift
//  setgam
//
//  Created by Zhe Liu on 7/20/20.
//  Copyright © 2020 Zhe Liu. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let topMiddlePoint = CGPoint(x: rect.midX, y: rect.minY)
        let leftMiddlePoint = CGPoint(x: rect.minX, y: rect.midY)
        let rightMiddlePoint = CGPoint(x: rect.maxX, y: rect.midY)
        let bottomMiddlePoint = CGPoint(x: rect.midX, y: rect.maxY)
        
        p.move(to: topMiddlePoint)
        p.addLine(to: leftMiddlePoint)
        p.addLine(to: bottomMiddlePoint)
        p.addLine(to: rightMiddlePoint)
        p.addLine(to: topMiddlePoint)
        
        return p
    }
}

struct DiamondShape_Previews: PreviewProvider {
    static var previews: some View {
        Diamond()
    }
}
