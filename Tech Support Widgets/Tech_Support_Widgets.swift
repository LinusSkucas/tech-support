//
//  Tech_Support_Widgets.swift
//  Tech Support Widgets
//
//  Created by Linus Skucas on 11/28/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SupportEntry {
        SupportEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SupportEntry) -> ()) {
        let entry = SupportEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SupportEntry] = [SupportEntry(date: Date())]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SupportEntry: TimelineEntry {
    var date: Date
}

struct Tech_Support_WidgetsEntryView : View {
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        Image("halp")
            .resizable()
            .padding(2)
    }
}

@main
struct Tech_Support_Widgets: Widget {
    let kind: String = "Tech_Support_Widgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Tech_Support_WidgetsEntryView()
        }
        .configurationDisplayName("Tech Support")
        .description("Quick Reference Tech Support!")
        .supportedFamilies([.systemLarge])
    }
}

struct Tech_Support_Widgets_Previews: PreviewProvider {
    static var previews: some View {
        Tech_Support_WidgetsEntryView()
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
