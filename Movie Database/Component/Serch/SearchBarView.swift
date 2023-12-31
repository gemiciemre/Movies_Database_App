//
//  SearchBarView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI


struct SearchBarView: UIViewRepresentable {
    
    let placeholder: String
    @Binding var text: String
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.delegate = context.coordinator
        searchBar.backgroundColor = UIColor(named: "ColorBackground")
        
        return searchBar
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: self.$text)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text = searchText
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
    
}
