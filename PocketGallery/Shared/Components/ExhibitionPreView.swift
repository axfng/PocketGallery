//
//  ExhibitionPreView.swift
//  PocketGallery
//
//  Created by alfeng on 1/19/25.
//

import SwiftUI

struct ExhibitionPreView: View {
    let exhibition: Exhibition
    
    @EnvironmentObject var objectViewModel: ObjectViewModel

    var body: some View {
        NavigationLink {
            ExhibitionView(exhibition: exhibition)
                .environmentObject(objectViewModel)
        } label: {
            VStack(alignment: .leading) {
                if let url = exhibition.primaryimageurl {
                    AsyncImage(url: URL(string: url)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 126)
                                .clipped()
                                .clipShape(.rect(cornerRadius: 8.0))
                            
                        } else if phase.error != nil {
                            Text("There was an error loading the image")
                        } else {
                            ProgressView()
                        }
                    }
                } else {
                    Text("No image available")
                }
                HStack {
                    Text(exhibition.title.truncated(to: 25))
                        .font(.headline.bold())
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    if let beginDate = exhibition.beginDateFormatted, let endDate = exhibition.endDateFormatted {
                        Text("\(DateFormatter.displayFormatForUI.string(from: beginDate)) - \(DateFormatter.displayFormatForUI.string(from: endDate))")
                            .font(.footnote.bold())
                            .foregroundStyle(.gray)
                    } else {
                        Text("Exhibition dates not available")
                            .italic()
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    
                }
                
                if let description = exhibition.description {
                    Text(description)
                        .lineLimit(3)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}

#Preview {
    let exhibition: Exhibition = Exhibition(id: 1539, title: "Gian Lorenzo Bernini: Sketches in Clay", exhibitionid: 1539, primaryimageurl: "https://nrs.harvard.edu/urn-3:HUAM:GS03664_dynmc", description: "In 1937, in one of its most far-sighted and spectacular purchases ever, the Fogg Art Museum acquired 27 Italian baroque terracotta sculptures, 15 of which are studies by the greatest sculptor of the 17th century, Gian Lorenzo Bernini (1598–1680). They include saints and allegorical figures, but perhaps most memorable are the extraordinarily vivid angels, seemingly descending directly from a heavenly realm in swirls of flowing drapery. Although small in scale, these sketches are monumental in conception. Nineteen ninety-eight is the quartercentenary of Bernini&#8217;s birth, and this event is being marked by exhibitions in Chicago, Philadelphia, and Washington D.C., as well as in Rome. \n\nAs the guardian of the most important body of Bernini’s intimate work-in-progress, the Harvard University Art Museums have dedicated a permanent collection gallery to these sculptures. Most of the works have not been on public exhibition for many years and they return to view following the most comprehensive study of such a body of material ever undertaken. The results of this collaborative research by members of the Fogg’s Department of Paintings, Sculpture, and Decorative Art and the Straus Center for Conservation and Technical Studies informs this innovative reinstallation and has been published as an issue of the Art Museums’ Bulletin. \n\nOrganized by Ivan Gaskell, Margaret S. Winthrop Curator, and Colette Czapski Hemingway, Andrew W. Mellon Intern, 1996–98, with contributions by Jeannine O’Grody, National Endowment for the Arts Intern, 1995–96, Department of Paintings, Sculpture, and Decorative Arts, Fogg Art Museum. \n\nFunding for the installation and its preparation was generously provided by the Samuel H. Kress Foundation, the Massachusetts Cultural Council, the Andrew W. Mellon Foundation, and the Seymour Slive Teaching Exhibition Fund of the Harvard University Art Museums.", begindate: "1998-02-28", enddate: "2008-06-30")
    return ExhibitionPreView(exhibition: exhibition)
        .environmentObject(ObjectViewModel())
}
