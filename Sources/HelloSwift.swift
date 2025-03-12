#if canImport(SwiftUI)
import SwiftUI
#endif

@main
struct MyExecutable {
    
    static func main() {
        
        // Argument Label != Parameter Name

        func square(of number: Int) -> Int {
            return number * number
        }

        let twoSquared = square(of: 2)

        struct Person {
            let name: String
            let age: Int
        }

        let people = [
            Person(name: "Alice", age: 20),
            Person(name: "Bob", age: 30),
            Person(name: "Charlie", age: 25),
        ]

        // Closure

        let peopleSortedByAge1 = people.sorted(by: { (lhs, rhs) in
            return lhs.age > rhs.age
        })

        let peopleSortedByAge2 = people.sorted(by: { (lhs, rhs) in
            lhs.age > rhs.age
        })

        // Trailing Closure

        let peopleSortedByAge3 = people.sorted { (lhs, rhs) in
            lhs.age > rhs.age
        }

        // Multiple Trailing Closure

        #if canImport(SwiftUI)
        withAnimation(.default, {

        }, completion: {

        })

        withAnimation(.default) {

        } completion: {

        }
        #endif
        
        // Shorthand Argument Names

        let peopleSortedByAge4 = people.sorted { $0.age > $1.age }

        // Key Paths

        let names1 = people.map { $0.name } // ["Alice", "Bob", "Charlie"]

        let names2 = people.map(\.name) // ["Alice", "Bob", "Charlie"]

        // Result Builder

        func buildArray(@StringsBuilder body: () -> [String]) -> [String] {
            return body()
        }

        let names3 = buildArray {
            "Alice"
            "Bob"
            "Charlie"
        } // ["Alice", "Bob", "Charlie"]

        @StringsBuilder
        func buildNamesList(includesCharlie: Bool) -> [String] {
            "Alice"
            "Bob"
            if includesCharlie {
                "Charlie"
            }
            ["David", "Eve"]
            for number in 1...5 {
                "Unknown \(number)"
            }
        }

        let names4 = buildNamesList(includesCharlie: false)
        // ["Alice", "Bob", "David", "Eve", "Unknown 1", "Unknown 2", "Unknown 3", "Unknown 4", "Unknown 5"]

        let names5 = buildNamesList(includesCharlie: true)
        // ["Alice", "Bob", "Charlie", "David", "Eve", "Unknown 1", "Unknown 2", "Unknown 3", "Unknown 4", "Unknown 5"]


        // Property Wrapper
        
        var number1 = Tracked1(value: 1)

        number1.value = 2
        number1.value = 3

        let number1History = number1.history // [1, 2, 3]
        
        @Tracked2 var number2 = 0
        
        number2 = 2 // _number2.wrappedValue = 2
        number2 = 3 // _number2.wrappedValue = 3
        
        let number2History = $number2 // [1, 2, 3] | _number2.projectedValue
        
    }

    let name = "opa"
    print(name)
    
}
