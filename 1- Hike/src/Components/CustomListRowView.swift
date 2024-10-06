//
//  CustomListRowView.swift
//  Hike
//
//  Created by Pichborith Kong on 10/5/24.
//

import SwiftUI

#Preview {
    List {
        CustomListRowView(rowLabel: "Designer",
                          rowIcon: "paintpalette",
                          rowContent: "John Doe",
                          rowTintColor: .pink)
    }
}

struct CustomListRowView: View {
    // MARK: - PROPERTIES

    var rowLabel: String
    var rowIcon: String
    var rowContent: String? = nil
    var rowTintColor: Color
    var rowLinkLabel: String? = nil
    var rowLinkDestination: String? = nil

    var body: some View {
        // 1. Basic Labeled Content
        // LabeledContent("Application", value: "Hike")

        // 2. Advanced Labeled Content
        LabeledContent {
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            }

        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }

                Text(rowLabel)
            }
        }
    }
}
