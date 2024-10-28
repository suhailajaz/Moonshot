//
//  Rectangular Divider.swift
//  Moonshot
//
//  Created by suhail on 28/10/24.
//

import SwiftUI

struct RectangularDivider: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(height: 1)
            .foregroundStyle(.white)
            .padding(.vertical)
    }
}

#Preview {
    RectangularDivider()
}
