//
//  LearnView.swift
//  Tarot
//
//  Created by Lindsay Clifford on 11/7/23.
//

import SwiftUI

struct SectionData: Identifiable {
    let id = UUID()
    let title: String
    let items: [String]
}

struct LearnView: View {
    @State private var selectedSection: SectionData?

    let sections = [
        SectionData(title: "Major Arcana", items: ["The Fool", "The Magician", "The High Priestess", "The Emperor", "The Empress", "The Hierophant", "The Lovers", "The Chariot", "Strength", "The Hermit", "Wheel of Fortune", "Justice", "The Hanged Man", "Death", "Temperance", "The Devil", "The Tower", "The Star", "The Moon", "The Sun", "Judgement", "The World"]),
        SectionData(title: "Wands", items: ["Ace of Wands", "Two of Wands", "Three of Wands", "Four of Wands", "Five of Wands", "Six of Wands", "Seven of Wands", "Eight of Wands", "Nine of Wands", "Ten of Wands", "Page of Wands", "Knight of Wands", "Queen of Wands", "King of Wands"]),
        SectionData(title: "Cups", items: ["Ace of Cups", "Two of Cups", "Three of Cups", "Four of Cups", "Five of Cups", "Six of Cups", "Seven of Cups", "Eight of Cups", "Nine of Cups", "Ten of Cups", "Page of Cups", "Knight of Cups", "Queen of Cups", "King of Cups"]),
        SectionData(title: "Swords", items: ["Ace of Swords", "Two of Swords", "Three of Swords", "Four of Swords", "Five of Swords", "Six of Wands", "Seven of Wands", "Eight of Wands", "Nine of Wands", "Ten of Wands", "Page of Swords", "Queen of Swords", "King of Swords"]),
        SectionData(title: "Pentacles", items: ["Ace of Pentacles", "Two of Pentacles", "Three of Pentacles", "Four of Pentacles", "Five of Pentacles", "Six of Pentacles", "Seven of Pentacles", "Eight of Pentacles", "Nine of Pentacles", "Ten of Pentacles", "Page of Pentacles", "Queen of Pentacles", "King of Pentacles"])
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Image("galaxy_2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

                VStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 0) {
                            ForEach(sections) { section in
                                Button(action: {
                                    selectedSection = section
                                }) {
                                    Text(section.title)
                                        .font(.system(size: 11))
                                        .padding()
                                }
                            }
                        }
                    }
                    .padding(.horizontal)

                    Divider()

                    // Display the selected section
                    if let selectedSection = selectedSection {
                        SectionView(data: selectedSection.items)
                    } else {
                        SectionView(data: sections.first?.items ?? [])
                    }
                }
            }
            .navigationTitle("Learn")
        }
    }
}

struct SectionView: View {
    let data: [String]
    
    var body: some View {
        List(data, id: \.self) { item in
            NavigationLink(destination: CardDetailView(cardName: item)) {
                HStack {
                    Image(cardImageName(for: item))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Text(item)
                }
            }
        }
    }
    
    func cardImageName(for cardName: String) -> String {
        switch cardName {
        case "The Fool": return "O The Fool"
        case "The Magician": return "1 The Magician"
        case "The High Priestess": return "2 The High Priestess"
        case "The Empress": return "3 The Empress"
        case "The Emperor": return "4 The Emperor"
        case "The Hierophant": return "5 The Hierophant"
        case "The Lovers": return "6 The Lovers"
        case "The Chariot": return "7 The Chariot"
        case "Strength": return "8 Strength"
        case "The Hermit": return "9 The Hermit"
        case "Wheel of Fortune": return "10 Wheel of Fortune"
        case "Justice": return "11 Justice"
        case "The Hanged Man": return "12 The Hanged Man"
        case "Death": return "13 Death"
        case "Temperance": return "14 Temperance"
        case "The Devil": return "15 The Devil"
        case "The Tower": return "16 The Tower"
        case "The Star": return "17 The Star"
        case "The Moon": return "18 The Moon"
        case "The Sun": return "19 The Sun"
        case "Judgement": return "20 Judgement"
        case "The World": return "21 The World"
            
        case "Ace of Wands": return "22 Ace of Wands"
        case "Two of Wands": return "23 Two of Wands"
        case "Three of Wands": return "24 Three of Wands"
        case "Four of Wands": return "25 Four of Wands"
        case "Five of Wands": return "26 Five of Wands"
        case "Six of Wands": return "27 Six of Wands"
        case "Seven of Wands": return "28 Seven of Wands"
        case "Eight of Wands": return "29 Eight of Wands"
        case "Nine of Wands": return "30 Nine of Wands"
        case "Ten of Wands": return "31 Ten of Wands"
        case "Page of Wands": return "32 Page of Wands"
        case "Knight of Wands": return "33 Knight of Wands"
        case "Queen of Wands": return "34 Queen of Wands"
        case "King of Wands": return "35 King of Wands"
        
        case "Ace of Cups": return "36 Ace of Cups"
        case "Two of Cups": return "37 Two of Cups"
        case "Three of Cups": return "38 Three of Cups"
        case "Four of Cups": return "39 Four of Cups"
        case "Five of Cups": return "40 Five of Cups"
        case "Six of Cups": return "41 Six of Cups"
        case "Seven of Cups": return "42 Seven of Cups"
        case "Eight of Cups": return "43 Eight of Cups"
        case "Nine of Cups": return "44 Nine of Cups"
        case "Ten of Cups": return "45 Ten of Cups"
        case "Page of Cups": return "46 Page of Cups"
        case "Knight of Cups": return "47 Knight of Cups"
        case "Queen of Cups": return "48 Queen of Cups"
        case "King of Cups": return "49 King of Cups"
        
        case "Ace of Swords": return "50 Ace of Swords"
        case "Two of Swords": return "51 Two of Swords"
        case "Three of Swords": return "52 Three of Swords"
        case "Four of Swords": return "53 Four of Swords"
        case "Five of Swords": return "54 Five of Swords"
        case "Six of Swords": return "55 Six of Swords"
        case "Seven of Swords": return "56 Seven of Swords"
        case "Eight of Swords": return "57 Eight of Swords"
        case "Nine of Swords": return "58 Nine of Swords"
        case "Ten of Swords": return "59 Ten of Swords"
        case "Page of Swords": return "60 Page of Swords"
        case "Knight of Swords": return "61 Knight ofSwords"
        case "Queen of Swords": return "62 Queen of Swords"
        case "King of Swords": return "63 King of Swords"
            
        case "Ace of Pentacles": return "64 Ace of Pentacles"
        case "Two of Pentacles": return "65 Two of Pentacles"
        case "Three of Pentacles": return "66 Three of Pentacles"
        case "Four of Pentacles": return "67 Four of Pentacles"
        case "Five of Pentacles": return "68 Five of Pentacles"
        case "Six of Pentacles": return "69 Six of Pentacles"
        case "Seven of Pentacles": return "70 Seven of Pentacles"
        case "Eight of Pentacles": return "71 Eight of Pentacles"
        case "Nine of Pentacles": return "72 Nine of Pentacles"
        case "Ten of Pentacles": return "73 Ten of Pentacles"
        case "Page of Pentacles": return "74 Page of Pentacles"
        case "Knight of Pentacles": return "75 Knight of Pentacles"
        case "Queen of Pentacles": return "76 Queen of Pentacles"
        case "King of Pentacles": return "77 King of Pentacles"
            
        default: return "card_back"
        }
    }
}

struct CardDetailView: View {
    let cardName: String
    
    var body: some View {
        VStack {
            Text("Details for \(cardName)")

            // Add more info about the card here
        }
        .navigationTitle(cardName)
    }
}


#Preview {
    LearnView()
}