//
//  ZQImageView.swift
//  ZQApp
//
//  Created by ZhiQiang wei on 2021/3/16.
//

import Foundation
import SwiftUI

struct ZQImageView: View {
    @State private var remoteImage : UIImage? = nil
    var url : String? = nil
    var placeholderImage = UIImage(named: "logo")
    
    var body: some View {
        return Image(uiImage: self.remoteImage ?? placeholderImage!)
            .onAppear(perform: fetchRemoteImage)
    }
    
    func fetchRemoteImage()
    {
        guard let url = URL(string: self.url ?? "") else { return }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let image = UIImage(data: data!){
                self.remoteImage = image
            }
            else{
                print(error ?? "")
            }
        }.resume()
    }
}

struct ZQImage_Previews: PreviewProvider {
    static var previews: some View {
        ZQImageView()
    }
}
