//
//  ReceiptViewModel.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/29/25.
//

import SwiftUI
import Vision
import SwiftData

@Observable
class ReceiptViewModel: ImageHandling {
    var images: [UIImage] = []
    var recognizedText: String = ""
    
    private var modelContext: ModelContext
    
    var currentReceipt: ReceiptModel?
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func addImage(_ image: UIImage) {
        images.append(image)
        performOCR(on: image)
    }
    
    func removeImage(at index: Int) {
        guard images.indices.contains(index) else { return }
        images.remove(at: index)
    }
    
    func getImages() -> [UIImage] {
        images
    }
    
    private func performOCR(on uiImage: UIImage) {
        guard let cgImage = uiImage.cgImage else {
            self.currentReceipt = nil
            return
        }
        
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self,
                  let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                self?.currentReceipt = nil
                return
            }
            
            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedStrings.joined(separator: "\n")
            let parsed = self.parseWithoutRegex(from: fullText)

            DispatchQueue.main.async {
                self.saveReceipt(store: parsed.store, totalAmount: parsed.totalAmount, orderDate: parsed.orderDate, image: uiImage)
            }
        }
        request.recognitionLevel = VNRequestTextRecognitionLevel.accurate
        request.recognitionLanguages = ["ko-KR"]
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        }
    }
    
    private func saveReceipt(store: String, totalAmount: Int, orderDate: Date, image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        
        let receipt = ReceiptModel(
            id: UUID(),
            store: store,
            totalAmount: totalAmount,
            orderDate: orderDate,
            createdAt: .now,
            receiptImage: imageData
        )
        
        do {
            modelContext.insert(receipt)
            try modelContext.save()
            
            self.currentReceipt = receipt  // 최신 영수증 저장
        } catch {
            print("❌ 저장 실패: \(error.localizedDescription)")
        }
    }
    
    private func parseWithoutRegex(from text: String) -> (store: String, totalAmount: Int, orderDate: Date) {
        let lines = text.components(separatedBy: .newlines)
        
        var store = "장소 없음"
        var totalAmount = 0
        var orderDate = Date() // 기본값
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        for (index, line) in lines.enumerated() {
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            print("🔹 [\(index)] \(trimmed)")
            
            if trimmed.contains("점") && store == "장소 없음" {
                store = "스타벅스 " + trimmed
            }
            
            if trimmed.contains("결제금액"), index + 2 < lines.count {
                let priceLine = lines[index + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    totalAmount = amount
                }
            }
            
            if trimmed.contains("-") && trimmed.contains(":") {
                if let parsedDate = dateFormatter.date(from: trimmed) {
                    orderDate = parsedDate
                }
            }
        }
        
        print("✅ 매장명: \(store)")
        print("✅ 총 금액: \(totalAmount)")
        print("✅ 주문일자: \(orderDate)")
        
        return (store, totalAmount, orderDate)
    }
}
