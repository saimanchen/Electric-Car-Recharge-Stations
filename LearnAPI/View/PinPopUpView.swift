import SwiftUI

struct PinPopUpView: View {
    
    @Binding var selectedStation: Station?
    
    var body: some View {
        ZStack(alignment: .leading) {
            AsyncImage(
                url:
                    URL(string: selectedStation?.image ?? "oh no"),
                
                content: { image in
                    image.resizable().opacity(0.8)
                },
                
                placeholder: {
                    Text("")
                        .font(.title)
                })
            .overlay(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color.black.opacity(0.01),
                            Color.black]),
                    startPoint: .center,
                    endPoint: .bottom))
            .overlay(
                LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.black,
                        Color.black.opacity(0.01)]),
                startPoint: .topLeading,
                endPoint: .center))
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(selectedStation?.paid == true ? "$$" : "Free of charge")
                }
                Spacer()
                Text(selectedStation?.title ?? "Error")
                    .font(.title)
                    .bold()
                
                HStack {
                    Text(selectedStation?.description ?? "Error")
                        .font(.caption)
                }
            }.foregroundColor(.white).padding()
        }
    }
}

//struct PinPopUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        PinPopUpView(selectedStation:       Station(id: "", title: "", image: ", description: "", coordinates: Coordinates(latitude: 0.1, longitude: 0.1), rating: station.rating, paid: station.paid))
//    }
//}
