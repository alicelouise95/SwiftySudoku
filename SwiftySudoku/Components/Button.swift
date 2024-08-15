import SwiftUI

struct ButtonView: View {
    let label: String
    let icon: String?
    
    init(
        label: String,
        icon: String? = nil
    ) {
        self.label = label
        self.icon = icon
    }
    
    var body: some View {
        HStack(spacing: 3) {
            Text(label)
        }
        .font(Font.custom("Nunito-Regular", size: 20))
        .padding(.vertical, 12)
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color.black, lineWidth: 1.0)
                .fill(Color.white.opacity(0.2))
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(label: "A button")
    }
}
