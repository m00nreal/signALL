//
//  Juego.swift
//  languageGame
//
//  Created by Jair Luna on 14/07/20.
//  Copyright © 2020 Jair Luna. All rights reserved.
//

import SwiftUI

struct Letra: Identifiable {
    var id = UUID()
    var name: String
}

let letras: [Letra] = [
    Letra(name: "A"), Letra(name: "B"), Letra(name: "C"),
    Letra(name: "D"), Letra(name: "E"), Letra(name: "F"),
    Letra(name: "G"), Letra(name: "H"), Letra(name: "I"),
    Letra(name: "J"), Letra(name: "K"), Letra(name: "L"),
    Letra(name: "M"), Letra(name: "N"), Letra(name: "O"),
    Letra(name: "P"), Letra(name: "Q"), Letra(name: "R"),
    Letra(name: "S"), Letra(name: "T"), Letra(name: "U"),
    Letra(name: "V"), Letra(name: "W"), Letra(name: "X"),
    Letra(name: "Y"), Letra(name: "Z")
]

struct Juego: View {
    var body: some View {
        List(letras) { letra in
            HStack{
                Text("Letra " + letra.name)
                Spacer()
                Image(letra.name)
            }
        }.navigationBarTitle("Lenguaje de señas", displayMode: .inline	)
        .navigationBarHidden(false)
    }
}

struct Juego_Previews: PreviewProvider {
    static var previews: some View {
        Juego()
    }
}
