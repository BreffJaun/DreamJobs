import SwiftUI
import SwiftData


@main
struct TraumJobsApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .modelContainer(for: [
                    Favorite.self,
                    Job.self,
                    Skill.self
                ])
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
