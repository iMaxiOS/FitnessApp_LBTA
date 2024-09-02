//
//  StatisticsCalendarSectionView.swift
//  FItnessHealtcare_LBTA
//
//  Created by iMac on 14.08.2024.
//

import SwiftUI

struct StatisticsCalendarCellView: View {
    @Binding var calendarSelected: CalendarModel
    var selected: CalendarModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .fill(calendarSelected.id != selected.id ? Color.davyGray : Color.lime)
            .frame(width: 36, height: 55)
            .overlay {
                VStack(spacing: 4) {
                    Text(selected.day)
                        .font(Font.Jakarta.regular(size: 10))
                    Text(selected.number)
                }
                .foregroundStyle(calendarSelected.id != selected.id ? Color.white : Color.raisinBlack)
                .font(Font.Jakarta.medium(size: 15))
            }
            .onTapGesture {
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                    calendarSelected = selected
                }
            }
    }
}

#Preview {
    StatisticsCalendarCellView(
        calendarSelected: .constant(CalendarModel.calendarMock[1]),
        selected: CalendarModel.calendarMock[1]
    )
}
