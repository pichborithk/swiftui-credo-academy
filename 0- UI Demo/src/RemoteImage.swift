//
//  RemoteImage.swift
//  ui-demo
//
//  Created by Pichborith Kong on 9/25/24.
//

import SwiftUI

#Preview {
    RemoteImage()
}

extension Image {
    func imageModifier() -> some View {
        resizable()
            .scaledToFit()
    }

    func iconModifier() -> some View {
        imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct RemoteImage: View {
    private let imageURL = "https://credo.academy/credo-academy@3x.png"

    var body: some View {
        // MARK: - BASIC

        /*
         AsyncImage(url: URL(string: imageURL))
         */

        // MARK: - SCALE

        // the greater the value of scale is, the smaller the image
        /*
          AsyncImage(url: URL(string: imageURL), scale: 3.0)
         */

        // MARK: - PLACEHOLDER

        /*
          AsyncImage(url: URL(string: imageURL)) { image in
              image.imageModifier()
          } placeholder: {
              Image(systemName: "photo.circle.fill")
                  .iconModifier()
          }
          .padding(40)
         */

        // MARK: - PHASE

        /*
         AsyncImage(url: URL(string: imageURL)) { phase in
             // SUCCESS:
             if let image = phase.image {
                 image.imageModifier()
             } else if phase.error != nil {
             // FAILURE:
                 Image(systemName: "ant.circle.fill").iconModifier()
             } else {
             // EMPTY:
                 Image(systemName: "photo.circle.fill").iconModifier()
             }
         }
         .padding(40)
         */

        // MARK: - ANIMATION

        AsyncImage(url: URL(string: imageURL),
                   transaction: Transaction(
                       animation: .spring(
                           response: 0.5,
                           dampingFraction: 0.6,
                           blendDuration: 0.25
                       ))) { phase in
            switch phase {
            case let .success(image):
                image.imageModifier()
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case .failure:
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }.padding(40)
    }
}
