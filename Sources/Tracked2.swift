@propertyWrapper
struct Tracked2 {
    
    var wrappedValue: Int {
        didSet {
            projectedValue.append(wrappedValue)
        }
    }
        
    var projectedValue: [Int] = []
    
    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
        self.projectedValue.append(wrappedValue)
    }
}
