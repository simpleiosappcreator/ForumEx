//
//  DownloadPostDataViewModel.swift
//  ForumEx
//
//  Created by HAHA on 21/9/2021.
//

import Foundation
import Combine

class DownloadPostDataViewModel: ObservableObject{
    let dataService = DownloadingDataService.instance

    @Published var data: [PostModel] = []
    @Published var isLoading: Bool = true
    
    var cancellables = Set<AnyCancellable>()
    
    init(){
        addData()
    }
    
    func addData(){
        dataService.$downloadedData
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] returnedData in
                self?.data = returnedData
            }
            .store(in: &cancellables)
        
        dataService.$isLoading
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] returnedData in
                self?.isLoading = returnedData
            }
            .store(in: &cancellables)
    }
}
