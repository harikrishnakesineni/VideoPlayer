//
//  QueryTag.swift
//  VideoPlayer
//
//  Created by Hari krishna on 30/04/23.
//

import SwiftUI

struct QueryTag: View {
    @State var query: Query
    @State var isSelected: Bool
    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .black : .gray)
            .padding(10)
            .background(.thinMaterial)
            .cornerRadius(10)
            
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: .food, isSelected: true)
    }
}
