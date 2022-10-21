import SwiftUI

struct StationView: View {
    var station: Station
    var body: some View {
        ZStack(alignment: .leading) {
            // background image
            AsyncImage(
                url:
                    URL(string: station.image),
                
                content: { image in
                    image.resizable().opacity(0.8)
                },
                
                placeholder: {
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.title)
                }).overlay(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color.black.opacity(0.01),
                                Color.black]),
                        startPoint: .center,
                        endPoint: .bottom))
            
            VStack(alignment: .leading) {
                Spacer()
                Text(station.title)
                    .font(.title)
                    .bold()
                Text(station.description)
                    .font(.caption)
            }.foregroundColor(.white).padding()
        }
        .frame(width: 350, height: 250)
        .background(.black)
        .cornerRadius(10)
        .padding(.top)
        
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(
            station: Station(
                id: 1,
                title: "Hello",
                image: "https://resources.news.e.abb.com/attachments/published/82941/en-US/3081E72A5C7C/ABB_launches_Terra_360_usecase_refueling_station_station_render_dpi.jpg",
                description: "hello hello hello hello",
                coordinates:
                    Coordinates(
                        latitude: 0.1,
                        longitude: 0.1),
                rating: 0.1,
                paid: false))
    }
}
