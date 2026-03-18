//
//  IssueView.swift
//  SwiftPortfolio
//
//  Created by Andre Veltens on 18.03.26.
//

import SwiftUI
import SwiftData

struct IssueView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var issue: Issue
    
    private var manager: IssueManager {
        IssueManager(modelContext: modelContext)
    }
    
    var body: some View {
        if issue.isDeleted {
            NoIssueView()
        } else {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        TextField("Title", text: $issue.title, prompt: Text("Enter the issue title here"))
                            .font(.title)
                        
                        Text("**Modified:** \(issue.modificationDate.formatted(date: .long, time: .shortened))")
                        
                        Text("**Status:** \(issue.issueStatus)")
                            .foregroundStyle(.secondary)
                    }
                    
                    Picker("Priority", selection: $issue.priority) {
                        Text("Low").tag(0)
                        Text("Medium").tag(1)
                        Text("High").tag(2)
                    }
                    
                    Menu {
                        ForEach(issue.tags ?? []) { tag in
                            Button {
                                issue.tags?.removeAll { $0 == tag }
                            } label: {
                                Label(tag.name, systemImage: "checkmark")
                            }
                        }
                        
                        let otherTags = manager.missingTags(from: issue)
                        
                        if !otherTags.isEmpty {
                            Divider()
                            
                            Section("Add Tags") {
                                ForEach(otherTags) { tag in
                                    Button(tag.name) {
                                        issue.tags?.append(tag)
                                    }
                                }
                            }
                        }
                    } label: {
                        Text(issue.tagList)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .animation(nil, value: issue.tagList)
                    }
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("Basic Information")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                        
                        TextField("Description", text: $issue.content, prompt: Text("Enter the issue description here"), axis: .vertical)
                    }
                }
            }
            .disabled(issue.isDeleted)
        }
    }
}

#Preview {
    let container = ModelContainer.sampleData
    let issue = try! container.mainContext.fetch(FetchDescriptor<Issue>()).first!
    IssueView(issue: issue)
        .modelContainer(container)
        .environment(AppState())
}
