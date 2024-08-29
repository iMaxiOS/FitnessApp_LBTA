//
//  Ext+Font.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 13.08.2024.
//

import SwiftUI

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}

extension Font {
    
    struct Jakarta {
        static func regular(size: CGFloat) -> Font {
            .custom("PlusJakartaSans-Regular", size: size)
        }
        
        static func medium(size: CGFloat) -> Font {
            .custom("PlusJakartaSans-Medium", size: size)
        }
        
        static func semiBold(size: CGFloat) -> Font {
            .custom("PlusJakartaSans-SemiBold", size: size)
        }
        
        static func bold(size: CGFloat) -> Font {
            .custom("PlusJakartaSans-Bold", size: size)
        }
    }
}
