import SwiftUI
import SwiftData


@main
struct TraumJobsApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .modelContainer(for: [
                    Favorite.self,
                    Job.self,
                    Skill.self
                ])
        }
    }
}
