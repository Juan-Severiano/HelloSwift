struct Tracked1 {
    
    var value: Int {
        didSet {
            history.append(value)
        }
    }
    
    var history: [Int] = []
    
    init(value: Int) {
        self.value = value
        self.history.append(value)
    }
}
