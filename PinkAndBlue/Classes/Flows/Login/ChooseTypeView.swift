//
// Created by kojiba on 01.10.2020.
// Copyright (c) 2020 PinkAndBlue. All rights reserved.
//

import SwiftUI

struct ChooseTypeView: View {

    @ObservedObject var dialogViewModel = DialogViewModel(messages: [])
    
    @State private var isNavigatingNext = false

    let animationTime = 0.2

    var body: some View {
        VStack {
            if dialogViewModel.messages.count > 0 {
                ScrollView {
                    DialogView(viewModel: self.dialogViewModel)
                }
                    .edgesIgnoringSafeArea(.bottom)
            }

            NavigationLink(destination: ChooseStageView(), isActive: $isNavigatingNext) {
                EmptyView()
            }
        }
            .navigationBarTitle("Choose Type", displayMode: .inline)
            .onAppear(perform: onAppear)
    }

    private func onAppear() {

        if self.dialogViewModel.messages.count > 0 {
            return
        }

        DispatchQueue.global().async {
            self.dialogViewModel.addMessageAsyncAnimated(.message("What are your brest cancer type?"))

            sleep(1)
            self.dialogViewModel.add(messages: [
                .option("Ductal Carcinoma In Situ (DCIS)", action: self.showNext),
                .option("Invasive Ductal Carcinoma (IDC)", action: self.showNext),
                .option("IDC Type: Tubular Carcinoma of the Breast", action: self.showNext),
                .option("IDC Type: Medullary Carcinoma of the Breast", action: self.showNext),
                .option("IDC Type: Mucinous Carcinoma of the Breast", action: self.showNext),
                .option("IDC Type: Papillary Carcinoma of the Breast", action: self.showNext),
                .option("IDC Type: Cribriform Carcinoma of the Breast", action: self.showNext),
                .option("Invasive Lobular Carcinoma (ILC)", action: self.showNext),
                .option("Inflammatory Breast Cancer", action: self.showNext),
                .option("Lobular Carcinoma In Situ (LCIS)", action: self.showNext),
                .option("Male Breast Cancer", action: self.showNext),
                .option("Molecular Subtypes of Breast Cancer", action: self.showNext),
                .option("Paget's Disease of the Nipple", action: self.showNext),
                .option("Phyllodes Tumors of the Breast", action: self.showNext),
                .option("Metastatic Breast Cancer", action: self.showNext),
            ],
                async: true)

        }
    }

    private func showNext(_: MessageViewModel) {
        self.isNavigatingNext = true
    }
}
