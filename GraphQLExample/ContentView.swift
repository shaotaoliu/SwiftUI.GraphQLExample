import SwiftUI

struct ContentView: View {
    
    @State private var countries: [GetAllCountriesQuery.Data.Country] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(countries, id: \.code) { country in
                        NavigationLink(destination: {
                            CountryDetailView(country : country)
                        }, label: {
                            HStack {
                                Text(country.emoji)
                                Text(country.name)
                            }
                        })
                    }
                }
                .listStyle(.plain)
            }
            .onAppear {
                Network.shared.getCountries(completion: { result in
                    if let result = result {
                        self.countries = result
                    }
                })
            }
            .navigationTitle("Countries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
