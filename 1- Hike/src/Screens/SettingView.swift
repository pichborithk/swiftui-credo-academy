//
//  SettingView.swift
//  Hike
//
//  Created by Pichborith Kong on 10/5/24.
//

import SwiftUI

#Preview {
    SettingView()
}

struct SettingView: View {
    // MARK: - PROPERTIES

    private let alternateAppIcon = ["AppIcon-MagnifyingGlass",
                                    "AppIcon-Map",
                                    "AppIcon-Mushroom",
                                    "AppIcon-Camera",
                                    "AppIcon-Backpack",
                                    "AppIcon-Campfire"]

    var body: some View {
        List {
            // MARK: - SECTION: HEADER

            Section {
                HStack {
                    Spacer()

                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))

                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))

                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    } //: VSTACK

                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))

                    Spacer()
                } //: HSTACK
                .foregroundStyle(LinearGradient(
                    colors: [
                        .colorGreenLight,
                        .colorGreenMedium,
                        .colorGreenDark,
                    ],
                    startPoint: .top,
                    endPoint: .bottom))
                .padding(.top, 8)

                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)

                    Text("The hick which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")

                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.colorGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } //: HEADER
            .listRowSeparator(.hidden)

            // MARK: - SECTION: ICONS

            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcon.indices, id: \.self) { index in
                            Button {
                                print("tapped")
                                UIApplication.shared.setAlternateIconName(alternateAppIcon[index]) { error in
                                    if error != nil {
                                        print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success! You have changed the app's icon to \(alternateAppIcon[index])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcon[index])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                } //: SCROLL VIEW
                .padding(.top, 12)

                Text("Choose your favorite app icon fro the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } //: ICONS
            .listRowSeparator(.hidden)

            // MARK: - SECTION: ABOUT

            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                } //: HSTACK
                .padding(.vertical, 8)
            ) {
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)

                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)

                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "SwiftUI", rowTintColor: .orange)

                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)

                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)

                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)

                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://credo.academy")
            } //: ABOUT
        } //: LIST
    }
}
