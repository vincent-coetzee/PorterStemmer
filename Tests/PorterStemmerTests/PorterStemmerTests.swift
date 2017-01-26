import XCTest
@testable import PorterStemmer

class PorterStemmerTests: XCTestCase
    {
    func testBasic()
        {
        let word = "convenience"
        if let stemmer = PorterStemmer()
            {
            XCTAssertNotNil(stemmer,"stemmer should not be nil")
            let stemmedWord = stemmer.stem(word)
            XCTAssertEqual(stemmedWord,"conveni","stemmed word should be conveni")
            }
        }
    
    func testEmptyString()
        {
        let word = ""
        let stemmer = PorterStemmer()
        XCTAssertNotNil(stemmer,"stemmer should not be nil")
        let stemmedWord = stemmer!.stem(word)
        XCTAssertEqual(stemmedWord,"","stemmed word should be empty")
        }
    
    func testFullWordList()
        {
        let stemmer = PorterStemmer()
        XCTAssertNotNil(stemmer,"stemmer should not be nil")
        let filePath = URL(fileURLWithPath: #file)
        let components = filePath.pathComponents.dropFirst().dropLast()
        let basePath = "/" + components.joined(separator: "/")
        let inputWords = readWords(fromPath: basePath + "/words.txt")
        let stemmedWords = readWords(fromPath: basePath + "/stemmed-words.txt")
        XCTAssertFalse(inputWords.isEmpty,"input words are empty");
        XCTAssertFalse(stemmedWords.isEmpty,"stemmed words are empty")
        XCTAssertEqual(inputWords.count,stemmedWords.count,"input and test input counts don't match")
        for index in 0..<inputWords.count
            {
            let word = inputWords[index]
            let stemmedWord = stemmer!.stem(word)
            XCTAssertEqual(stemmedWord,stemmedWords[index],"stemmed input is '\(stemmedWord)' and should be '\(stemmedWords[index])'")
            }
        }

    func readWords(fromPath:String) -> [String]
        {
        let url = URL(fileURLWithPath:fromPath)
        guard let allWords = try? String(contentsOf: url,encoding: .utf8) else
            {
            return([])
            }
        let words = allWords.components(separatedBy: "\n").dropLast()
        return(Array(words))
        }
    
    static var allTests : [(String, (PorterStemmerTests) -> () throws -> Void)]
        {
        return [
            ("testBasic", testBasic),
            ("testEmptyString", testEmptyString),
            ("textFullWordList", testFullWordList)
        ]
        }
    }
