//
//  CardView.swift
//  Hike
//
//  Created by Pichborith Kong on 10/3/24.
//

import SwiftUI

#Preview {
    CardView()
}

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber = 1
    @State private var isShowingSheet = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        var randomNumber: Int
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        // MARK: - CARD

        ZStack {
            CustomBackgroundView()

            VStack {
                // MARK: - HEADER

                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(
                                colors: [.colorGrayLight, .colorGrayMedium],
                                startPoint: .top,
                                endPoint: .bottom))

                        Spacer()

                        Button {
                            // ACTION: Show a Sheet
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }

                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.colorGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)

                // MARK: - MAIN CONTENT

                ZStack {
                    CustomCircleView()

                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
//                        .animation(.easeOut(duration: 1), value: imageNumber)
                }

                // MARK: - FOOTER

                Button {
                    // ACTION: Generate a random number
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(
                            colors: [.colorGreenLight, .colorGreenMedium],
                            startPoint: .top,
                            endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25),
                                radius: 0.25,
                                x: 1,
                                y: 2)
                }
                .buttonStyle(GradientButton())
            } //: VSTACK
        } //: CARD
        .frame(width: 320, height: 570)
    }
}
