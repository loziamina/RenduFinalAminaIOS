import SwiftUI

struct LoginFormUser: View {
    @Environment(\.managedObjectContext) var context
    @StateObject var viewModel = UserViewModel()


    var body: some View {
                NavigationView {
                    Form {
                        TextField("UserName", text: $viewModel.userName)
                        SecureField("Password", text: $viewModel.password)
                        Button("SIGN IN") {
                            if viewModel.login() {
                                print("Login successful")
            
                            } else {
                                print("Login failed")
                            }
                        }
                    }
                    .navigationBarTitle("Sign In")
                }
            }
        }

#Preview {
    LoginFormUser()
}
