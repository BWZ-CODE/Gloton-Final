//
//  ContentView.swift
//  Gloton 3.0
//
//  Created by Miguel Angel Bohorquez on 2/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCategory = 0
    @State private var selectedTab = 0
   
    
    var categories = ["Recomendados", "Faciles","Entradas", "Sopas", "Postres", "Veggie"]
    var recomendados = ["Pollo con champiñones", "Ensalada Cesar", "Lasagna", "Pizza Margherita"]
    
    
    var body: some View {
        ZStack{
            Color.hueso.opacity(0.9).edgesIgnoringSafeArea(.all)
            //area principal, va a mostrar diferentes pantallas dependiendo del tab
            VStack(spacing: 20) {
                if selectedTab == 0 {
                    HomeScreenView(selectedCategory: $selectedCategory, categories: categories)
                }else if selectedTab == 1 {
                    worldView()
                }else if selectedTab == 2 {
                    searchView()
                }
            }
            .padding(.top, 20)
            
            VStack{
                Spacer()//manda lo que voy a colocar a la derecha superior
                notificationsView()
                    .padding(.trailing)
            }
            Spacer()//manda la info de las notificaciones al top
            
            //Ahora la configuración del tab bar en el bottom
            VStack{
                Spacer()
                ProfessionalTapBar(selectedTab: $selectedTab)
                    .padding(.bottom, 10)
            }
        }
    }
}

//Ahora vamos a confugurar el home Screen
struct HomeScreenView: View {
    @Binding var selectedCategory: Int // Binding es para que el padre actualice la información actual que tiene
    var categories: [String] // Lista de las categorias
    
    // Ahora vamos a colocar el formato de la fecha
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 20) {
            //top header con un titulo y la fecha
            VStack(alignment: .leading) {
                Text("Qué quieres cocinar?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(dateFormatter.string(from: Date()))
                    .font(.footnote)
                    .foregroundStyle(Color.background)
            }
            .frame(maxWidth: .infinity, alignment: .center) // alinea el header al centro
            .padding(.horizontal)
            
            //Ahora las categorias
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 30) {
                    //un ciclo a traves de cada categoria para crear un botón
                    ForEach(categories.indices, id: \.self) {
                        index in CategoryButton( title: categories[index], isSelected: index == selectedCategory) {
                            withAnimation{
                                selectedCategory = index // anima y actualiza la categoria seleccionada
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding()
            .background(.ultraThinMaterial.opacity(1))
            .cornerRadius(20)
            .shadow(color: .background.opacity(0.2), radius: 10, x: 0, y: 5)
            .padding(.horizontal, 5)
            // Contenido dinamico: Muestra diferentes vistas dependiendo de la categoria seleccionada
            
            Group {
                if selectedCategory == 0 {
                    RecomendadosView()
                        .transition(.slide)
                }else if selectedCategory == 1 {
                    facilesView()
                        .transition(.slide)
                }else if selectedCategory == 2 {
                    EntradasView()
                        .transition(.slide)
                }else if selectedCategory == 3 {
                    SopasView()
                        .transition(.slide)
                }else if selectedCategory == 4 {
                    PostresView()
                        .transition(.slide)
                }else if selectedCategory == 5 {
                    VeggieView()
                        .transition(.slide)
                }
            }
            .animation(.bouncy, value: selectedCategory) //Anima el elegido
            
            Spacer() // Llena cualquier espacio en blanco
        }
    }
}

// Ahora la vista para recomendados
struct RecomendadosView: View {
    
    
    var body: some View {
        VStack {
            //Segun tus gustos
            VStack(spacing: 10) {
                Text("Según tus gustos").foregroundStyle(Color.background).font(.title2).bold().padding().padding(.horizontal,20).frame(width:400 ,alignment: .leading)
                ScrollView(.horizontal, showsIndicators: false ){
                    HStack (spacing: 15){
                        
                        VStack{
                            Image(.polloChampiñones)
                                .resizable()
                                .modifier(imagenesRecetas())
                            Text("Pollo con champiñones")
                                .modifier(textoImagenes())
                        }
                        VStack{
                            Image(.polloChampiñones)
                                .resizable()
                                .modifier(imagenesRecetas())
                            Text("Pollo con champiñones") .modifier(textoImagenes())
                        }
                        VStack{
                            Image(.polloChampiñones)
                                .resizable()
                                .modifier(imagenesRecetas())
                            Text("Pollo con champiñones") .modifier(textoImagenes())
                        }
                        VStack{
                            Image(.polloChampiñones)
                                .resizable()
                                .modifier(imagenesRecetas())
                            Text("Pollo con champiñones") .modifier(textoImagenes())
                                
                        }
                        VStack{
                            Image(.polloChampiñones)
                                .resizable()
                                .modifier(imagenesRecetas())
                            Text("Pollo con champiñones") .modifier(textoImagenes())
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.vertical, 5)
                
                
            }
            .frame(width: 387)
            .background(.ultraThickMaterial.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .shadow(color: .background.opacity(0.2), radius: 10, x: 0, y: 5)
            // Favoritos del momento
            VStack(spacing: 10) {
                Text("Favoritos del momento").foregroundStyle(Color.background).font(.title2).bold().padding().padding(.horizontal, 20).frame(width:400 ,alignment: .leading)
                ScrollView(.horizontal, showsIndicators: false ){
                    HStack (spacing: 15){
                        
                        VStack{
                            Image(.polloChampiñones)
                                .resizable()
                                .modifier(imagenesRecetas())
                            Text("Pollo con champiñones") .modifier(textoImagenes())
                        }
                        VStack{
                            Image(.polloChampiñones)
                                .resizable()
                                .modifier(imagenesRecetas())
                            Text("Pollo con champiñones") .modifier(textoImagenes())
                        }
                        VStack{
                            Image(.polloChampiñones)
                                .resizable()
                                .modifier(imagenesRecetas())
                            Text("Pollo con champiñones") .modifier(textoImagenes())
                        }
                        VStack{
                            Image(.polloChampiñones)
                                .resizable()
                                .modifier(imagenesRecetas())
                            Text("Pollo con champiñones") .modifier(textoImagenes())
                        }
                        VStack{
                            Image(.polloChampiñones)
                                .resizable()
                                .modifier(imagenesRecetas())
                            Text("Pollo con champiñones") .modifier(textoImagenes())
                        }
                    }
                    .padding(.horizontal, 15)
                    
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.vertical, 5)
            }
            .frame(width: 387)
            .background(.ultraThickMaterial.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .shadow(color: .background.opacity(0.2), radius: 10, x: 0, y: 5)
        }
        
        
    }
}

//Vista de faciles
struct facilesView: View {
    var body: some View {
        Text("Faciles")
    }
    
}

// Vista de entradas
struct EntradasView: View {
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: true){
                VStack(spacing: 0){
                    VStack{
                        Image(.polloChampiñones)
                            .resizable()
                            .modifier(imagenesEntradas())
                        Text("Pizza Margarita")
                            .modifier(textoEntradas())
                            
                    }
                    VStack{
                        Image(.polloChampiñones)
                            .resizable()
                            .modifier(imagenesEntradas())
                        Text("Pizza Margarita")
                            .modifier(textoEntradas())
                            
                    }
                    VStack{
                        Image(.polloChampiñones)
                            .resizable()
                            .modifier(imagenesEntradas())
                        Text("Pizza Margarita")
                            .modifier(textoEntradas())
                            
                    }
                    VStack{
                        Image(.polloChampiñones)
                            .resizable()
                            .modifier(imagenesEntradas())
                        Text("Pizza Margarita")
                            .modifier(textoEntradas())
                            
                    }
                    VStack{
                        Image(.polloChampiñones)
                            .resizable()
                            .modifier(imagenesEntradas())
                        Text("Pizza Margarita")
                            .modifier(textoEntradas())
                            
                    }
                        
                        
                }
                
            }.padding().frame(width: 390)
        
        }.background(.ultraThickMaterial.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .shadow(color: .hueso.opacity(0.9), radius: 10, x: 0, y: 5)
    }
}

//
struct SopasView: View {
    var body: some View {
        Text("Entradas")
    }
}

// Ahora la vista para recomendados
struct PostresView: View {
    var body: some View {
        Text("Recomendados")
    }
}

// Vista de entradas
struct VeggieView: View {
    var body: some View {
        Text("Entradas")
    }
}

//Vista de busqueda

struct searchView: View {
    @State private var query: String = "" // variable state para el texto de busqueda
    var body: some View {
        VStack(spacing: 20) {
            //header de la busqueda
            HStack{
                Text("Buscar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            .offset(y: -20) // Ajusta el header hacia arriba
            
            //text field para buscar
            TextField("Lo que quieras comer...", text: $query)
                .padding()
                .background(Color.blue.opacity(0.3))
                .cornerRadius(15)
                .padding(.horizontal, 20)
            
            //Scroll de la lista de los resultados
            
            ScrollView{
                VStack(spacing: 15) {
                    // ciclo para mostrar multiples resultados
                    ForEach(0..<5) { index in
                        HStack{
                            Image("polloChampiñones")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)
                            VStack(alignment: .leading) {
                                Text("Plato \(index)")
                                    .font(.headline)
                                Text("Short description of \(index)")
                                    .font(.subheadline)
                                    .foregroundStyle(Color.black)
                            }
                            Spacer() // Manda el contenido a la izquierda
                        }
                        .padding()
                        .background(Color.background.opacity(0.3))
                        .cornerRadius(15)
                        .padding(.horizontal)
                        
                    }
                }
            }
            /*.Spacer()*/ //Llena los espacios verticales en blanco
        }
        .padding(.top)
        
    }
}

//Vista de mundo

struct worldView: View {
    var body: some View {
        Text("Entradaaas")
    }
}

//Vista de notificaciones

struct notificationsView: View {
    var body: some View {
        Text("")
    }
}


//MARK: Shared components

//CategoryButton crea un botón para seleccionar una categoria
struct CategoryButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View{
        Button (action: action) {
            VStack {
                // Display the category title.
                Text (title)
                    .font (.callout)
                    .fontWeight(.medium)
                    .foregroundColor(isSelected ? Color.background : .black)
                   
                // If selected show an underline.
                if isSelected {
                    Capsule()
                        .frame (height: 8)
                        .foregroundColor(Color.background)
                        .transition(.scale)
                        // fade transition
                    
                }
            }
        }
    }
}


//MARK: Ahora el tab bar

struct ProfessionalTapBar: View {
    @Binding var selectedTab: Int // Binding para seleccionar el actual tab
    
    var body: some View {
        HStack {
            Spacer()//Espacio antes del primer tab item
            
            //Tab item para home
            TabBarItem(icon: "house.fill", title: "Home", isSelected: selectedTab == 0)
            .onTapGesture {
                    withAnimation {selectedTab = 0}
                }
            Spacer()
            //Tab item para World
            TabBarItem(icon: "globe", title: "World", isSelected: selectedTab == 1)
            .onTapGesture {
                withAnimation {selectedTab = 1}
                }
            Spacer()
            //Tab item para search
            TabBarItem(icon: "magnifyingglass", title: "Search", isSelected: selectedTab == 2)
            .onTapGesture {
                withAnimation {selectedTab = 2}
                }
            Spacer()
            
        }
        .padding() // padding interno para la barra
        .background(.ultraThinMaterial) //
        .clipShape(Capsule()) // Da la apariencia de bordes redondeados
        .shadow(color: .background.opacity(0.2), radius: 10, x: 0, y: 5) // sombra de profundidad
        .padding(.horizontal) // padding horizontal desde el bordes de la pantalla
    }
}

// Representa cada item del tab bar
    
struct TabBarItem: View {
    let icon: String //nombre de SF symbol
    let title: String // titulo del tab
    let isSelected: Bool //Indica si el tab es actualmente seleccionado
    
    var body: some View {
        VStack(spacing: 0) {
            // muestra el icono con una animacion de escala cuando es seleccionado
            Image(systemName: icon)
                .font(.title2)
                .scaleEffect(isSelected ? 1.2 : 1.0)
                .animation(.bouncy, value: isSelected)
            // Muestra el tab title
            Text(title)
                .font(.caption)
                .foregroundStyle(isSelected ? .botones : Color.background)
            
        }
        .foregroundStyle(isSelected ? .botones : Color.background)
    }
}



//MARK: MODIFICADORES
struct textoImagenes: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .bold()
            .padding(.vertical, 5)
            .foregroundStyle(Color.background)
    }
}

struct imagenesRecetas: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:130, height: 130)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
    }
}

struct imagenesEntradas: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 320, height: 200)
            .cornerRadius(16)
            .shadow(color: .background.opacity(0.4), radius: 10, x: 0, y: 5)
    }
}

struct textoEntradas: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.ultraThickMaterial)
            .cornerRadius(16)
            .bold()
            .offset( y: -70)
        
    }
}


#Preview {
    ContentView()
}
