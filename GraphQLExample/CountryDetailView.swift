import SwiftUI

struct CountryDetailView: View {
    
    let country: GetAllCountriesQuery.Data.Country
    @State private var countryInfo: GetCountryInfoQuery.Data.Country?
    
    var body: some View {
        List {
            ForEach(countryInfo?.states ?? [], id: \.name) { state in
                Text(state.name)
            }
        }
        .listStyle(.plain)
        .onAppear {
            Network.shared.getCountryDetail(code: country.code) { result in
                self.countryInfo = result
            }
        }
        .navigationTitle("States")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: GetAllCountriesQuery.Data.Country(code: "US", name: "United States", emoji: ""))
    }
}
