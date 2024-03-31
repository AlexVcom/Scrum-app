import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeesString)
                if let taranscript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(taranscript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeesString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name})
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(attendees: [
            DailyScrum.Attendee(name: "Jaś"),
            DailyScrum.Attendee(name: "Daria"),
            DailyScrum.Attendee(name: "Lucyna")
        ],
        transcript: "Daria, would you like to start today? Sure, yesterday I reviewed Lucyna' PR and met with the design team to finalize the UI...")
    }
    
    static var previews: some View {
        HistoryView(history: history)
    }
}
