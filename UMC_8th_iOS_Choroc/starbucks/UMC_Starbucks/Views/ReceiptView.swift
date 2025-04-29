import SwiftUI
import PhotosUI
import SwiftData

struct ReceiptView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ReceiptModel.createdAt, order: .reverse) var receipts: [ReceiptModel]
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var showCamera = false
    @State private var showActionSheet = false
    @State private var showPhotosPicker = false
    
    @State private var showReceiptImage = false
    @State private var selectedImage: UIImage = UIImage()
    
    @State private var viewModel: ReceiptViewModel

    init(modelContext: ModelContext) {
        _viewModel = State(initialValue: ReceiptViewModel(modelContext: modelContext))
    }
    
    var body: some View {
        topBarGroup
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    Spacer().frame(height: 16)
                    receiptList
                    Spacer()
                }
            }
            .background(Color("background"))
            .scrollIndicators(.hidden)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .fullScreenCover(isPresented: $showReceiptImage) {
            ZStack {
                Color.black.opacity(0.8).ignoresSafeArea()
                
                ZStack(alignment: .topTrailing) {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                    
                    Button(action: {
                        showReceiptImage = false
                    }) {
                        Image(systemName: "xmark")
                            .padding(16)
                    }
                }
            }
        }
    }
    
    private var topBarGroup: some View {
        VStack {
            HStack(spacing: 130) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 16, height: 10)
                }
                Text("전자 영수증")
                    .font(.mainTextMedium16)
                Button(action: {
                    showActionSheet = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .frame(height: 56)
        .background(.white)
        .confirmationDialog("영수증을 어떻게 추가할까요?", isPresented: $showActionSheet, titleVisibility: .visible) {
            Button("앨범에서 가져오기") { showPhotosPicker = true }
            Button("카메라로 촬영하기") { showCamera = true }
            Button("취소", role: .cancel) { }
        }
        .sheet(isPresented: $showCamera) {
            CameraPicker { image in
                viewModel.addImage(image)
            }
        }
        .photosPicker(isPresented: $showPhotosPicker, selection: $selectedItems, maxSelectionCount: 5, matching: .images)
        .onChange(of: selectedItems) { oldItems, newItems in
            for item in newItems {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        viewModel.addImage(image)
                    }
                }
            }
        }
    }
    
    private var receiptList: some View {
        VStack(spacing: 24) {
            let totalReceiptCount = receipts.count
            let totalPrice = receipts.reduce(0) { $0 + $1.totalAmount }
            
            HStack {
                Text("총 ")
                    .font(.mainTextRegular18)
                + Text("\(totalReceiptCount)건")
                    .font(.mainTextSemibold18)
                    .foregroundStyle(Color("brown01"))
                
                Spacer()
                Text("사용합계 ")
                    .font(.mainTextRegular18)
                + Text("\(totalPrice)원")
                    .font(.mainTextSemibold18)
                    .foregroundStyle(Color("brown01"))
            }
            .padding(.horizontal, 17)
            
            ForEach(receipts) { receipt in
                HStack {
                    VStack(alignment: .leading, spacing: 9) {
                        Text(receipt.store)
                            .font(.mainTextSemibold18)
                        Text(formattedDate(receipt.orderDate))
                            .font(.mainTextSemibold16)
                            .foregroundStyle(Color("gray03"))
                        Text("\(receipt.totalAmount)원")
                            .font(.mainTextSemibold18)
                            .foregroundStyle(Color("brown01"))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if let data = receipt.receiptImage, let uiImage = UIImage(data: data) {
                            selectedImage = uiImage
                            showReceiptImage = true
                        }
                    }) {
                        Image(.receiptIcon)
                            .resizable()
                            .frame(width: 16, height: 20)
                    }
                }
                Divider()
                    .foregroundStyle(Color("gray01"))
            }
            .padding(.horizontal, 17)
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        return formatter.string(from: date)
    }
}
