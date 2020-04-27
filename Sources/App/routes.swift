import Vapor

public func routes(_ router: Router) throws {
    var tracks = [Favourites]()
    router.get { req in
        return "It works!"
    }
    func saveDataToFile(newList: [String : [Quote]]) {
        let directory = DirectoryConfig.detect()
        let configDir = "Sources/App/Models"
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(newList) {
            do {
                let filePath = URL(fileURLWithPath: directory.workDir)
                    .appendingPathComponent(configDir, isDirectory: true)
                    .appendingPathComponent("AllQuotes.json", isDirectory: false)
                try jsonData.write(to: filePath)
            } catch {
                print(error)
            }
        }
    }
    router.post(Quote.self, at:"saveQuote") { req, list -> QuotesList in
        var currentList = getCurrentList()
        currentList.allQuotes.append(list)
        let format: [String: [Quote]] = ["allQuotes": currentList.allQuotes]
        saveDataToFile(newList: format)
        return currentList
    }
    func getCurrentList() -> QuotesList {
        let quote = Quote(id: 1, firstName: "default", lastName: "default", quote: "default")
        var list: QuotesList = QuotesList(allQuotes: [quote])
        let directory = DirectoryConfig.detect()
        let configDir = "Sources/App/Models"
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: directory.workDir)
                .appendingPathComponent(configDir, isDirectory: true)
                .appendingPathComponent("AllQuotes.json", isDirectory: false))
            let out = try JSONDecoder().decode(QuotesList.self, from: data)
            print(out)
            list = out
        } catch {
            print(error)
        }
        return (list)
    }
    router.get("allQuotes") { req -> QuotesList in
        let listOfQuotes = getCurrentList()
        return listOfQuotes
    }
}
