//
//  ContentView.swift
//  languageGame
//
//  Created by Jair Luna on 14/07/20.
//  Copyright © 2020 Jair Luna. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var alertaInfo = false
    @State private var alertaAbout = false
    @State private var selection: String? = nil;
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                HStack{
                    Button(action: {
                        self.alertaInfo = true
                    }) {
                        Text("Como jugar")
                    }
                    .padding(.leading, 10.0)
                    .alert(isPresented: $alertaInfo) { () -> Alert in
                        Alert(title: Text("Como Jugar"), message: Text("Una imágen será presentada al centro de la pantalla cada turno. Usted deberá presionar el boton que muestre la opción correcta de letra para obtener puntos."), dismissButton: .default(Text("¡Entiendo!")))
                    }
                    Spacer()
                    NavigationLink(destination: Juego()) {
                        Text("Abecedario")
                    }
                    .padding(.trailing, 10.0)
                }
                Spacer()
                Image("front")
                Text("Rompe la barrera de comunicación que existe entre las personas sordas y las personas oyentes")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding(.all, 10.0)
                Spacer()
                NavigationLink(destination: Jugar(), tag: "Game", selection: $selection) {
                    EmptyView()
                }
                Button(action: {
                    self.selection = "Game"
                }) {
                    Text("Jugar")
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25.0)
                        .padding(.vertical, 12.0)
                        .background(Color.green)
                        .foregroundColor(.white)
                    .cornerRadius(5)
                    
                }
                Spacer()
                Button(action: {
                    self.alertaAbout = true
                }) {
                    Text("Acerca de")
                }
                .padding(.leading, 10.0)
                .alert(isPresented: $alertaAbout) { () -> Alert in
                    Alert(title: Text("ITL México"), message: Text("App desarrollada por Arel Jair Monreal Luna en el Instituto Tecnológico de la Laguna"), dismissButton: .default(Text("¡Asombroso!")))
                }
            }
            .navigationBarTitle("Inicio", displayMode: .inline)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


