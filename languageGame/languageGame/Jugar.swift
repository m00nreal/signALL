//
//  Jugar.swift
//  languageGame
//
//  Created by Jair Luna on 14/07/20.
//  Copyright © 2020 Jair Luna. All rights reserved.
//

import SwiftUI

struct Jugar: View {
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
    @State var puntuacion: Int = 0
    @State var aciertos: Int = 0
    @State var errores: Int = 0
    @State var letraActual: String = "question"
    @State var juegoActual: [Letra] = [
    Letra(name: "?"), Letra(name: "?"), Letra(name: "?")
    ]
    @State var isCorrect: String = ""
    @State var tiempo: Int = 60
    @State var finalizo = false
    
    @State private var countdownTimer: Timer?
    
    var body: some View {
                    
        VStack{
            Spacer()
            Group {
                Button(action: {
                    self.newRound()
                    self.iniciarJuego()
                    if(self.tiempo <= 0) {
                        self.finalizo = true
                    }
                }){
                    Text("Jugar")
                    .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 25.0)
                        .padding(.vertical, 12.0)
                        .background(Color.green)
                        .foregroundColor(.white)
                    .cornerRadius(5)
                }.alert(isPresented: self.$finalizo) {
                    Alert(title: Text("El juego finalizó"), message: Text("Su puntuación fue \(self.puntuacion)"), dismissButton: .default(Text("¡Ok!")))
                }
                Spacer()
                Text(String(self.tiempo))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Group {
                Text("Esta es la letra...")
                    .font(.title)
                    .fontWeight(.bold)
                Image(letraActual)
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.comprobar(letra: self.juegoActual[0].name)
                    }) {
                        Text(String(juegoActual[0].name))
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
                        self.comprobar(letra: self.juegoActual[1].name)
                    }) {
                        Text(String(juegoActual[1].name))
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
                        self.comprobar(letra: self.juegoActual[2].name)
                    }) {
                        Text(String(juegoActual[2].name))
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 25.0)
                            .padding(.vertical, 12.0)
                            .background(Color.green)
                            .foregroundColor(.white)
                        .cornerRadius(5)
                    }
                    Spacer()
                }
            }
            Spacer()
            Image(self.isCorrect)
                .frame(width: 48.0, height: 48.0)
            Spacer()
            HStack{
                Spacer()
                Text("Puntuacion: ")
                Text(String(self.puntuacion))
                Spacer()
                Text("Aciertos: ")
                Text(String(self.aciertos))
                Spacer()
                Text("Errores: ")
                Text(String(self.errores))
                Spacer()
            }
            Spacer()
        }
        
    }
    
    func iniciarJuego() {
        self.tiempo = 60
        self.errores = 0
        self.puntuacion = 0
        self.aciertos = 0
       self.countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            guard self.tiempo > 0 else {
            self.countdownTimer?.invalidate()
            self.finalizo = true
            return
        }
           self.tiempo -= 1
        })
    }
    
    func comprobar(letra: String) {
        if letra == self.letraActual {
            puntuacion += 50
            self.aciertos += 1
            self.isCorrect = "ok"
        } else {
            self.errores += 1
            self.isCorrect = "no"
        }
        newRound()
    }
    
    func newRound() {
        getRandomLetter()
        self.letraActual = juegoActual[Int.random(in: 0...juegoActual.count-1)].name
        
    }
    
    func getRandomLetter() {
        var letrasB = letras
        for x in 0...2 {
            let indiceLetra = Int.random(in: 0...letrasB.count-1)
            let letra = letrasB[indiceLetra]
            juegoActual[x] = letra
            letrasB.remove(at: indiceLetra)
        }
    }

    
}

struct Jugar_Previews: PreviewProvider {
    static var previews: some View {
        Jugar()
    }
}
