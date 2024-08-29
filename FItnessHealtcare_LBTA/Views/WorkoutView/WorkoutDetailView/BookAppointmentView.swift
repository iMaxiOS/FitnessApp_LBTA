//
//  BookAppointmentView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 20.08.2024.
//

import SwiftUI

struct BookAppointmentView: View {
    @EnvironmentObject var session: SessionManager
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Environment(\.dismiss) private var dismiss
    @State private var date = Date()
    @State private var comment: String = ""
    @State private var isBookAppointment: Bool = false
    @FocusState private var isFocused: Bool
    
    let workout: WorkoutModel
    
    var body: some View {
        ZStack {
            Color.BG
        
            ScrollView(showsIndicators: false) {
                ZStack {
                    if !isBookAppointment {
                        calendarSectionView
                    } else {
                        paymentSectionView
                    }
                }
                .padding(.top, 245)
                .padding(.bottom, 105)
            }
            .padding(.horizontal, 5)
        }
        .overlay(alignment: .top) {
            topContentSection
                .overlay(alignment: .topLeading) {
                    BackNavigationButtonView()
                        .padding(.top, safeAreaInsets.top - 5)
                        .padding(.horizontal, 20)
                }
        }
        .overlay(alignment: .bottom) {
            if isBookAppointment {
                confirmButton
            } else {
                CustomAppointmentButton {
                    isBookAppointment.toggle()
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .ignoresSafeArea()
    }
}

private extension BookAppointmentView {
    var topContentSection: some View {
        VStack(spacing: 0) {
            Text("Appountment")
                .font(Font.Jakarta.medium(size: 19))
                .padding(.top, safeAreaInsets.top)
                .padding(.bottom, 40)
            
                WorkoutTrainersCellView(workout: workout)
        }
        .padding([.horizontal, .bottom], 15)
        .frame(maxWidth: .infinity)
        .foregroundStyle(.tint)
        .background(Color.raisinBlack.opacity(0.9))
        .background(.ultraThinMaterial)
        .clipShape(.rect(bottomLeadingRadius: 50, bottomTrailingRadius: 50))
    }
    
    var calendarSectionView: some View {
        VStack(alignment: .leading, spacing: 10) {
            DatePicker("", selection: $date)
                .datePickerStyle(.graphical)
                .preferredColorScheme(.dark)
            
            RoundedRectangle(cornerRadius: 1)
                .frame(height: 1)
                .frame(maxWidth: .infinity)
            
            Text("Comment")
                .padding(.leading, 10)
            
            ZStack(alignment: .topLeading) {
                if comment.isEmpty {
                    Text("Leave a comment for tainer")
                        .font(Font.Jakarta.regular(size: 12))
                        .padding()
                }
                
                TextEditor(text: $comment)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 10)
                    .font(Font.Jakarta.regular(size: 13))
                    .frame(maxWidth: .infinity, minHeight: 70, maxHeight: 150)
                    .scrollContentBackground(.hidden)
                    .submitLabel(.done)
                    .background(.raisinBlack.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .onChange(of: comment) { _ in
                        if comment.last?.isNewline == .some(true) {
                            comment.removeLast()
                            isFocused = false
                        }
                    }
                    .focused($isFocused)
            }
        }
        .padding(.horizontal, 10)
        .padding([.horizontal, .bottom], 15)
        .frame(maxWidth: .infinity)
        .background(.davyGray)
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 50))
    }
    
    var paymentSectionView: some View {
        VStack(spacing: 10) {
            BoxView {
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Order Details")
                            .font(Font.Jakarta.medium(size: 17))
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Name")
                                .font(Font.Jakarta.medium(size: 12))
                            Text("Online lesson with Chris Heria")
                                .font(Font.Jakarta.medium(size: 14))
                                .foregroundStyle(.tint.opacity(0.6))
                        }
                        .foregroundStyle(.dimGray)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Date")
                                .font(Font.Jakarta.medium(size: 12))
                            Text(date, style: .date)
                                .font(Font.Jakarta.medium(size: 14))
                                .foregroundStyle(.tint.opacity(0.6))
                        }
                        .foregroundStyle(.dimGray)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Time")
                                .font(Font.Jakarta.medium(size: 12))
                            Text(date, style: .time)
                                .font(Font.Jakarta.medium(size: 14))
                                .foregroundStyle(.tint.opacity(0.6))
                        }
                        .foregroundStyle(.dimGray)
                        
                        Text("Comment")
                            .font(Font.Jakarta.medium(size: 12))
                    }
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(comment)
                            .font(Font.Jakarta.medium(size: 14))
                            .padding(20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.raisinBlack.opacity(0.6))
                            )
                    }
                    .foregroundStyle(.dimGray)
                }
            }
            
            BoxView {
                VStack(alignment: .leading, spacing: 5) {
                    HStack(spacing: 2) {
                        Text("Billing Address")
                            .foregroundStyle(.tint)
                        
                        Spacer()
                        
                        Button {} label: {
                            HStack(spacing: 2) {
                                Image(systemName: "applepencil.gen1")
                                    .renderingMode(.template)
                                Text("Edit")
                                    .font(Font.Jakarta.medium(size: 12))
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    .foregroundStyle(.lime)
                    .padding(.bottom, 10)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Lester Powle")
                        Text("123 Billing Street, Billingtown")
                        Text("Kentucky K1POB7")
                        Text("United Stated")
                        
                    }
                    .font(Font.Jakarta.medium(size: 12))
                    .foregroundStyle(.tint.opacity(0.6))
                    .padding(.bottom, 10)
                }
                .padding(.horizontal, 10)
            }
            
            BoxView {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Select your Card")
                        .foregroundStyle(.tint)
                        .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 15) {
                            Image("1")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Master Card")
                                    .font(Font.Jakarta.regular(size: 13))
                                Text("4433 **** **** 1976")
                                    .font(Font.Jakarta.regular(size: 15))
                                    .foregroundStyle(.tint)
                            }
                            
                            Spacer()
                            
                            ZStack {
                                Circle()
                                    .strokeBorder(.tint, style: .init(lineWidth: 1))
                                
                                Circle()
                                    .fill(.lime)
                                    .padding(4)
                            }
                            .frame(width: 20, height: 20)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(.raisinBlack.opacity(0.6))
                        .clipShape(Capsule())
                    }
                    .font(Font.Jakarta.medium(size: 12))
                    .foregroundStyle(.tint.opacity(0.6))

                    
                    HStack {
                        Text("Add a new card/payment method")
                            .font(Font.Jakarta.regular(size: 12))
                            .foregroundStyle(.tint.opacity(0.6))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.lime)
                    }
                    .padding(15)
                    .background(.raisinBlack.opacity(0.6))
                    .clipShape(Capsule())
                }
            }
        }
        .font(Font.Jakarta.medium(size: 17))
    }
    
    var confirmButton: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 3) {
                Text("Total price")
                    .font(Font.Jakarta.regular(size: 15))
                    .foregroundStyle(.dimGray)
                Text("$ 44.99")
                    .font(Font.Jakarta.bold(size: 25))
                    .foregroundStyle(.lime)
            }
            .padding(.leading)
            
            Spacer()
            
            Button {
                dismiss.callAsFunction()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "arrow.down.backward.circle")
                    Text("Confirm")
                        .font(Font.Jakarta.semiBold(size: 15))
                }
                .foregroundStyle(.raisinBlack)
                .padding(15)
                .padding(.horizontal)
                .background(.lime)
                .clipShape(RoundedRectangle(cornerRadius: 50))
            }
            .buttonStyle(.plain)
            .padding(.bottom)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.raisinBlack)
        .clipShape(.rect(cornerRadius: 50))
    }
}

#Preview {
    BookAppointmentView(workout: WorkoutModel.categoryData[.workouts]![0])
        .environmentObject(SessionManager())
}
