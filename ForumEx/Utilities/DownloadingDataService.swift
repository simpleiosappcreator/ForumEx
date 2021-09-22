//
//  DownloadingDataService.swift
//  DrinksOrderApp
//
//  Created by HAHA on 1/8/2021.
//

import Foundation
import Combine

class DownloadingDataService: ObservableObject{
    static var instance = DownloadingDataService()
    
    @Published var downloadedData: [PostModel] = []
    @Published var isLoading: Bool = true
    var cancellables = Set<AnyCancellable>()
    
    init(){
        downloadData()
    }
    
    func downloadData(){
        // Using firebase
//        db.collection("drinksInfo").addSnapshotListener { querySnapshot, error in
//            guard let documents = querySnapshot?.documents else{
//                print("No documents")
//                return
//            }
//            self.downloadedData = documents.map{ QueryDocumentSnapshot -> Drink in
//                let data = QueryDocumentSnapshot.data()
//
//                let id = data["id"] as? Int ?? 0
//                let name = data["name"] as? String ?? ""
//                let price = data["price"] as? Int ?? 0
//                let availableStatus = data["availableStatus"] as? String ?? ""
//                let description = data["description"] as? String ?? ""
//                let imageUrl = data["imageUrl"] as? String ?? ""
//
//                return Drink(id: id, name: name, price: price, availableStatus: availableStatus, description: description, imageUrl: imageUrl)
//            }
//        }
        
//         Using Combine //https://jsonplaceholder.typicode.com/comments //https://jsonkeeper.com/b/74XO
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else{return}

        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data. \(error)")
                }
            } receiveValue: { [weak self] returnedData in
                self?.downloadedData = returnedData
                self?.isLoading = false
            }
            .store(in: &cancellables)

    }
    
//     Using Combine
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else{
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
