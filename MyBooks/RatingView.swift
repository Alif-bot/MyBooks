//
//  RatingView.swift
//  MyBooks
//
//  Created by Md Alif Hossain on 21/10/24.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    var maximumRating = 5
    var onColor = Color.yellow
    var ofColor = Color.gray
    
    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { number in
                Image(systemName: "star.fill")
                    .foregroundColor(number <= rating ? onColor : ofColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}

#Preview {
    RatingView(rating: .constant(5))
}
