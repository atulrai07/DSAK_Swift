//
//  DashboardView.swift
//  DSAK
//
//  Created by Atul on 30/12/25.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Choose a Topic")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Text("Kickstart your Data Structures journey.")
                        .font(.body)
                        .foregroundStyle(.gray)
                }
                .padding(.top, 20)
                
                // Stack Card
                NavigationLink(destination: TopicOverviewView()) {
                    TopicCard(
                        title: "Stack",
                        subtitle: "Last In, First Out (LIFO)",
                        gradientColors: [.blue, .purple],
                        iconName: "square.stack.3d.up.fill",
                        time: "5 min"
                    )
                }
                
                // Queue Card
                TopicCard(
                    title: "Queue",
                    subtitle: "First In, First Out (FIFO)",
                    gradientColors: [.green, .blue],
                    iconName: "tray.full.fill",
                    time: "5 min"
                )
            }
            .padding()
        }
        .navigationBarHidden(true)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    DashboardView()
}
