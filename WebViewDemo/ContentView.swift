//
//  ContentView.swift
//  WebKitDemo
//
//  Created by jht2 on 3/28/23.
//

import SwiftUI
import WebKit

let gold = Color(red: 1.0, green: 0.84, blue: 0.0) // Custom gold color

let urls = [
  "https://jht9629-nyu.github.io/p5mirror-jht9629-nyu/p5projects/shapes%20random%20pause%20v22-n0LYuXRmX/",
  "https://editor.p5js.org/jht9629-nyu/sketches/n0LYuXRmX",
  "https://jht9629-nyu.github.io/p5mirror-jht9629-nyu/p5projects/ims04-jht%20scroll%20color%20rate-2pxhnehBV/",
  "https://editor.p5js.org/jht9629-nyu/sketches/2pxhnehBV",
  "https://itp.nyu.edu",
  "https://upload.wikimedia.org/wikipedia/commons/0/0a/Flag_of_Jamaica.svg",
  "https://upload.wikimedia.org/wikipedia/commons/9/99/Flag_of_Guyana.svg",
  "https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg",
  "https://upload.wikimedia.org/wikipedia/commons/5/52/Flag_of_%C3%85land.svg",
  "https://upload.wikimedia.org/wikipedia/commons/6/6a/Flag_of_Zimbabwe.svg",
  "https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_the_Taliban.svg",
  "https://www.apple.com",
]
let url = urls[0];

struct ContentView: View {
  var body: some View {
    ZStack {
      WebView(url: urls[0])
      VStack {
        Spacer()
        Text("Hello p5")
          .padding(10)
//          .background(Color.yellow)
          .background([Color.red, gold, Color.green].randomElement() ?? Color.red)
          .font(.title)
          .bold()
      }
    }
  }
}

struct WebView : UIViewRepresentable {
  let url: String
  func makeUIView(context: Context) -> WKWebView  {
    // frame does not appear to affect
    // return WKWebView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    return WKWebView()
  }
  func updateUIView(_ uiView: WKWebView, context: Context) {
    let nurl = URL(string: url)
    guard let nurl = nurl else {
      print("URL failed url", url)
      return;
    }
    uiView.load(URLRequest(url: nurl))
  }
}

#Preview {
  ContentView()
}

// https://developer.apple.com/forums/thread/117348

// https://medium.com/devtechie/webview-in-swiftui-a9c283f29327

// flag svg link source:
// https://github.com/linssen/country-flag-icons/blob/master/countries.json

