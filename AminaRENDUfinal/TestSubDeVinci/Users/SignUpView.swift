import SwiftUI

struct SignUpView: View {
    @Environment(\.managedObjectContext) private var context
        @StateObject private var viewModel = UserViewModel()

        var body: some View {
            NavigationView {
                Form {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Family Name", text: $viewModel.familyName)
                    TextField("UserName", text: $viewModel.userName)
                    SecureField("Password", text: $viewModel.password)
                    Button("SIGN UP") {
                        viewModel.signUp()
                    }
                    .disabled(viewModel.firstName.isEmpty || viewModel.familyName.isEmpty || viewModel.userName.isEmpty || viewModel.password.isEmpty)
                }
                .navigationBarTitle("Sign Up")
            }
        }
    }

#Preview {
    SignUpView()
}
