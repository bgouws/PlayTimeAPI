import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "I'll flipen kill you!"
    }
    
    router.get("quotes") { req -> [String: [Quote]] in
        let quote1 = Quote(id: 0, firstName: "Unknown", lastName: "Unknown", quote: "Don't limit your challenges.\nChallenge your limits.")
        let quote2 = Quote(id: 1, firstName: "Unknown", lastName: "Unknown", quote: "Everything you need will come to you\nat the perfect time.")
        let quote3 = Quote(id: 2, firstName: "Unknown", lastName: "Unknown", quote: "You didn't come this far to only come this far.")
        let quote4 = Quote(id: 3, firstName: "Unknown", lastName: "Unknown", quote: "I will not be stopped.")
        let quote5 = Quote(id: 4, firstName: "Unknown", lastName: "Unknown", quote: "Yes it's going to be hard,\nbut it's going to be worth it.")
        let quote6 = Quote(id: 5, firstName: "Unknown", lastName: "Unknown", quote: "Great things never come from comfort zones.")
        let quote7 = Quote(id: 6, firstName: "Unknown", lastName: "Unknown", quote: "Don't stop until you're proud")
        let quote8 = Quote(id: 7, firstName: "Unknown", lastName: "Unknown", quote: "What ever you decide to do,\nmake sure it makes you happy.")
        let quote9 = Quote(id: 8, firstName: "Aly", lastName: "Raisman", quote: "The hard days are what make you stronger")
        let quote10 = Quote(id: 9, firstName: "Napoleon", lastName: "Hill", quote: "If you cannot do great things,\ndo small things in a great way!")
        return ["quotes": [quote1, quote2, quote3, quote4, quote5, quote6, quote7, quote8, quote9, quote10]]
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
