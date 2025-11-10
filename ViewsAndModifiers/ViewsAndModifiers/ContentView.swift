//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mashu Giga on 2025/11/08.
//

import SwiftUI

struct ContentView: View {
  @State private var useRedText = false

  var body: some View {
    Color.blue
      .frame(width: 300, height: 200)
      .watermarked(with: "Hacking with Swift")
  }
}

struct Watermark: ViewModifier {
  var text: String

  func body(content: Content) -> some View {
    ZStack(alignment: .bottomTrailing) {
      content
      Text(text)
        .font(.caption)
        .foregroundStyle(.white)
        .padding(5)
        .background(.black)
    }
  }
}

extension View {
  func watermarked(with text: String) -> some View {
    modifier(Watermark(text: text))
  }
}

#Preview {
  ContentView()
}
