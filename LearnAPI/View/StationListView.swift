//
//  StationListView.swift
//  LearnAPI
//
//  Created by Saiman Chen on 2022-10-21.
//

import SwiftUI

struct StationListView: View {
    @ObservedObject var stationList: StationList

    var body: some View {
        ScrollView {
            ForEach(stationList.stations) { station in
                StationView(station: station)
            }
        }
        .task {
            await stationList.fetchStations()
            
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView(stationList: StationList())
    }
}
