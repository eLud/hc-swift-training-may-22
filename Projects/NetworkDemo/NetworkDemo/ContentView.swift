//
//  ContentView.swift
//  NetworkDemo
//
//  Created by Ludovic Ollagnier on 03/06/2022.
//

import SwiftUI

struct ContentView: View {

    @State var image: Image?
    @State var value: Double = 0

    var body: some View {
        VStack {
            Slider(value: $value)
            Button("Get image") {
                getImage()
            }
            if let image = image {
                image
                    .resizable()
            }
        }
    }

    private func getImage() {

        // Get a session
        let session = URLSession.shared

        // Get the URL
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Durbarnuwkot.jpg/1920px-Durbarnuwkot.jpg")!

        // Create the task
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            guard let downloadedImage = UIImage(data: data) else { return }

            DispatchQueue.main.async {
                image = Image(uiImage: downloadedImage)
            }
        }

        // Execute the task
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
