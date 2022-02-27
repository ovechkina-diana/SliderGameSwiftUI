//
//  SliderView.swift
//  SliserGameSwiftUI
//
//  Created by Diana Ovechkina on 27.02.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable  {
    
    
    @Binding var currentValue: Float
    @Binding var targetValue: Int
    @Binding var alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .red.withAlphaComponent(alpha)
        slider.value = currentValue
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.sliderValue),
                         for: .allEvents)
    
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
    }
    
    func computerScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var currentValue: Float
        
        init(currentValue: Binding<Float>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderValue(_ sender: UISlider) {
            currentValue = sender.value
        }
        
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(10), targetValue: .constant(35), alpha: .constant(0.5))
    }
}
