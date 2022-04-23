import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    lazy var client = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
    
    private init() {}
    
    
    func getCountries(completion: @escaping ([GetAllCountriesQuery.Data.Country]?) -> Void) {
        
        client.fetch(query: GetAllCountriesQuery()) { result in
            switch result {
            case .success(let gqlResult):
                if let data = gqlResult.data?.countries {
                    completion(data)
                }
                
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
    
    func getCountryDetail(code: GraphQLID, completion: @escaping (GetCountryInfoQuery.Data.Country?) -> Void) {
        
        client.fetch(query: GetCountryInfoQuery(code: code)) { result in
            switch result {
            case .success(let gqlResult):
                if let data = gqlResult.data?.country {
                    completion(data)
                }
                
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}
