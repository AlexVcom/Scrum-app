import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
        secondsElapsed + secondRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1}
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int {
        secondRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Second Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Second Remaining")
                        .font(.caption)
                    Label("\(secondRemaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time rmaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondRemaining: 180, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
