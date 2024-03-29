//
//  ContentView.swift
//  Tarot
//
//  Created by Lindsay Clifford on 6/1/23.
//

import SwiftUI

<<<<<<< HEAD
struct MainTabView: View {
=======
struct HomeView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                       ZStack {
                           Image("galaxy_2")
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: geometry.size.width, height: geometry.size.height)    // the frame of the image is set to the size obtained from the geometry parameter
                           
                           Color.clear.overlay(
                               VStack(alignment: .center, spacing: 10) {
                                   
                                   Image("logo")
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .padding(-20)
                                       
                                   Text("Tempest Tarot").font(.custom("Respira-Black", size: 30))
                                       .fontWeight(.semibold)
                                       .foregroundColor(.white)
                                       .multilineTextAlignment(.center)
                                       .padding(.bottom, 10)
                                       
                                   
                                   Text("Precise divination at your fingertips, offering guidance wherever you roam.")
                                       .font(.system(size: 20))
                                       .font(.largeTitle)
                                       .fontWeight(.thin)
                                       .foregroundColor(.white)
                                       .multilineTextAlignment(.center)
                                       .padding(.bottom, 10)
                                   
                                       Spacer()
                               }
                               .frame(maxWidth: .infinity, maxHeight: .infinity)
                           )
                       }
                   }
                   .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DailyView: View {
    @State private var cardImage: String = "1 The Magician"
    @State private var isRandomizing: Bool = false
    @State private var isCardRevealed: Bool = false
    @State private var isWiggling: Bool = false
    
    let cards: [String] = [
        "1 The Magician", "2 The High Priestess", "3 The Empress", "4 The Emperor",
        "5 The Hierophant", "6 The Lovers", "7 The Chariot", "8 Strength", "9 The Hermit", "10 Wheel of Fortune",
        "11 Justice", "12 The Hanged Man", "13 Death", "14 Temperance", "15 The Devil",
        "16 The Tower", "17 The Star", "18 The Moon", "19 The Sun", "20 Judgement", "21 The World",
        "22 Ace of Wands", "23 Two of Wands", "24 Three of Wands", "25 Four of Wands", "26 Five of Wands",
        "27 Six of Wands", "28 Seven of Wands", "29 Eight of Wands", "30 Nine of Wands", "31 Ten of Wands",
        "32 Page of Wands", "33 Knight of Wands", "34 Queen of Wands", "35 King of Wands",
        "36 Ace of Cups", "37 Two of Cups", "38 Three of Cups", "39 Four of Cups", "40 Five of Cups",
        "41 Six of Cups", "42 Seven of Cups", "43 Eight of Cups", "44 Nine of Cups", "45 Ten of Cups",
        "46 Page of Cups", "47 Knight of Cups", "48 Queen of Cups", "49 King of Cups",
        "50 Ace of Swords", "51 Two of Swords", "52 Three of Swords", "53 Four of Swords", "54 Five of Swords",
        "55 Six of Swords", "56 Seven of Swords", "57 Eight of Swords", "58 Nine of Swords", "59 Ten of Swords",
        "60 Page of Swords", "61 Knight of Swords", "62 Queen of Swords", "63 King of Swords",
        "64 Ace of Pentacles", "65 Two of Pentacles", "66 Three of Pentacles", "67 Four of Pentacles",
        "68 Five of Pentacles", "69 Six of Pentacles", "70 Seven of Pentacles", "71 Eight of Pentacles",
        "72 Nine of Pentacles", "73 Ten of Pentacles", "74 Page of Pentacles", "75 Knight of Pentacles",
        "76 Queen of Pentacles", "77 King of Pentacles", "O The Fool"
    ]

    
    func shuffleArray<T>(_ array: [T]) -> [T] {
        var newArray = array
        for i in stride(from: newArray.count - 1, through: 1, by: -1) {
            let j = Int.random(in: 0...i)
            newArray.swapAt(i, j)
        }
        return newArray
    }
    
// Function to randomize the cards
    func randomizeCard() {
        if !isRandomizing {
            isRandomizing = true
            
            var shuffledCards = shuffleArray(cards)
            
            let timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
                shuffledCards = shuffleArray(shuffledCards)
                cardImage = shuffledCards[0]
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                timer.invalidate()
                isRandomizing = false
                //isCardRevealed = true
            }
        }
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("galaxy_2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    Image("wheel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width * 2, height: geometry.size.width * 2)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.01)
                        .opacity(0.1)
                    
                    Color.clear.overlay(
                        VStack(alignment: .center, spacing: 10) {
                            Text(dateFormatter.string(from: Date()))
                                .font(.system(size: 20))
                                .font(.largeTitle)
                                .fontWeight(.thin)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.top, 100)
                            
                            Text("Daily Reading")
                                .font(.custom("Respira-Black", size: 30))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 0)
                            
                            Spacer()
  
 // Shuffle BUTTON
                            Button(action: {
                                randomizeCard()
                                //isWiggling = true
                            }) {
                                Text("Shuffle")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.bottom, 220)
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    )
                    
// If - else card is revealed
                    if isCardRevealed {
                        Image(cardImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.4) // Adjust the size of the card image to fit your design
                            .padding(.bottom, 50) // Adjust the padding as needed
                        
                        
                    } else {
                        Image("card_back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.4) // Adjust the size of the card image to fit your design
                            .padding(.bottom, 50) // Adjust the padding as needed
                    }
                    
// If - else card is currently shuffling
                    if isRandomizing {
                        
                    }
                    if !isRandomizing {
                        Button(action: {
                            randomizeCard()
                            isCardRevealed = true
                            //isWiggling = false
// Draw Card BUTTON
                        }) {
                            Text("Draw Card")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .padding(.top, 600)
                        }
                        
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}



struct ReadingsView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("galaxy_2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
            .navigationTitle("Readings")
            // Gets rid of the white bars on top/bottom
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LearnView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("galaxy_2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
            .navigationTitle("Learn")
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SettingsView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Image("galaxy_2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
            .navigationTitle("Settings")
            //.edgesIgnoringSafeArea(.all)
        }
    }
}


struct ContentView: View {
>>>>>>> df72e994784d70c93477c1cf7f4a42dad192228f
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            DailyView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Daily")
                }
            
            ReadingsView()
                .tabItem {
                    Image(systemName: "eye")
                    Text("Readings")
                }
            
            LearnView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Learn")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        }
<<<<<<< HEAD
        .accentColor(.white)
    }
}

=======
    }
}


>>>>>>> df72e994784d70c93477c1cf7f4a42dad192228f
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

