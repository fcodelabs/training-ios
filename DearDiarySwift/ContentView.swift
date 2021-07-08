//
//  ContentView.swift
//  DearDiarySwift
//
//  Created by Kalana Rathnayaka on 2021-07-06.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = NotesViewModel()
    @State var text = ""
    var body: some View {
        ZStack {
            Image("3175")
            VStack {
                HStack {
                    Image("logo").resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("Dear Diary").font(.title2)
                        .padding()
                }
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Sign In"/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 60))
                        .foregroundColor(Color.blue)
                        .padding(.bottom)
                    TextField(/*@START_MENU_TOKEN@*/"Your Nichname*"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .frame(width: 300.0, height: 50.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .padding(.bottom,15)
                    
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("RANDOM")
                            .font(.system(size: 19))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
                            .frame(height: 50.0)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                            .cornerRadius(30)
                    }
                    .padding(.bottom,15)
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        HStack(spacing:10) {
                            Text("CONTINUE")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Image(systemName: "arrow.right").foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: 300.0, height: 60.0)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        .cornerRadius(30)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 30.0/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
            }
            
        }
        //second screen
        
        ZStack {
//                        Image("3175")
            HStack{
                NavigationView{
                    VStack {
                        Section(header: Text("Your are here: Home")
                                    .padding(.vertical, 25.0)){
                            TextField("Submit New",text: $text).padding().frame(width: 300.0, height: 50.0).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).cornerRadius(10)
                            
                            //                            TextField("Enter Description",text: $text).padding(.bottom, 80.0).frame(width: 300.0, height: 130.0).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/).cornerRadius(8)
                            
                            
                            Button(action: {
                                tryToAddList()
                            }, label: {
                                Text("Submit").foregroundColor(Color.black).frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                            })
                            .padding(.leading, 35.0)
                            
                        }
                        
                        List {
                            ForEach(viewModel.notes){
                                notes in NoteRows(title: notes.title)
                            }
                            
                            
                        }
                        .navigationTitle("Home")
                    }
                }
                
                
            }
        }
        
    }
    func tryToAddList() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
            
        }
        let newNotes = Notes(title: text)
        viewModel.notes.append(newNotes)
        text=""
        
    }
    
}

struct Notes: Identifiable{
    var id = UUID()
    let title:String
}
class NotesViewModel: ObservableObject{
    @Published var notes: [Notes]=[
        Notes(title: "Leneovo"),
        Notes(title: "Leneovo"),
        Notes(title: "Leneovo"),
        Notes(title: "Leneovo"),
    ]
    
}

struct NoteRows: View  {
    let title:String
    
    var body: some View{
        Text(title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
