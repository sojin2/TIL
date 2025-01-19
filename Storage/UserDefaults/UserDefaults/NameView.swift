import SwiftUI

struct NameView: View {
    @State private var name: String = ""
    @State private var greeting: String = "안녕하세요!"
    @State private var isNameEntered: Bool = false
    
    // 외부에서 색상 값을 받아서 사용할 수 있도록 프로퍼티 추가
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        VStack {
            Image("망곰이")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Rectangle())
            
            Text("\(greeting)")
                .font(.largeTitle)
                .foregroundColor(textColor)
            
            if !isNameEntered {
                Text("이름을 알려주세요 :)")
                    .font(.title2)
                    .foregroundColor(textColor)
                
                TextField("이름 입력", text: $name)
                    .padding()
                    .background(backgroundColor.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal, 50)
                    .multilineTextAlignment(.center)
                    .foregroundColor(textColor)
                
                Button("확인", action: {
                    saveName()
                    updateGreeting()
                    isNameEntered = true
                })
                .padding()
                .frame(maxWidth: .infinity) // 화면 너비에 맞게 확장
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.top, 20)
                .padding(.horizontal, 20) // 좌우 20포인트 여백
                
            } else {
                Text("\(name)님 :)")
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
        }
        .multilineTextAlignment(.center)
        .background(backgroundColor) // 전체 배경색 설정
        .onAppear {
            loadName()
        }
    }
    
    private func saveName() {
        UserDefaults.standard.set(name, forKey: "UserName")
    }
    
    private func loadName() {
        if let savedName = UserDefaults.standard.string(forKey: "UserName"), !savedName.isEmpty {
            name = savedName
            updateGreeting()
            isNameEntered = true
        }
    }
    
    private func updateGreeting() {
        if !name.isEmpty {
            greeting = "안녕하세요!"
        }
    }
}

#Preview {
    NameView(backgroundColor: Color.white, textColor: Color.black)
}

