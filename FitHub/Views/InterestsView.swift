//
//  InterestsView.swift
//  FHOffline
//
//  Created by Roberto on 11/11/21.
//

import SwiftUI

struct InterestsView: View {
    @ObservedObject var fithubViewModel: FitHubViewModel
    //@State private var selection = Set<String>()
    
    var body: some View {
        List(FitHubViewModel.interestList, id: \.self, selection: $fithubViewModel.selection) { interest in
            Text(interest)
        }
        //.onDisappear()
        .navigationTitle("Select Interests")
        .toolbar {
            EditButton()
        }
    }
//    @State private var selection = Set<String>()
//
//    var body: some View {
//        List(FitHubViewModel.interestList,id: \.self) {item in
//
//            Text(item)
//        }
//        .toolbar(content: {
//            EditButton()
//        })
//        .navigationBarTitle("Select Interests", displayMode: .large  )
//    }
}

struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView(fithubViewModel: FitHubViewModel())
    }
}
