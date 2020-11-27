//
//  DiskCaretaker.swift
//  RabbleWabble
//
//  Created by Milo Wyner on 11/25/20.
//

import Foundation

public final class DiskCaretaker {
    public static let decoder = JSONDecoder()
    public static let encoder = JSONEncoder()
    
    public static func save<T: Codable>(_ object: T, to fileName: String) throws {
        do {
            let url = createDocumentURL(withFileName: fileName)
            let data = try encoder.encode(object)
            try data.write(to: url, options: .atomic)
        } catch {
            print("Save failed: Object: `\(object)`, " + "Error: `\(error)`")
            throw error
        }
    }
    
    public static func retrieve<T: Codable>(_ type: T.Type, from fileName: String) throws -> T {
        let url = createDocumentURL(withFileName: fileName)
        return try retrieve(T.self, from: url)
    }
    
    public static func retrieve<T: Codable>(_ type: T.Type, from url: URL) throws -> T {
        do {
            let data = try Data(contentsOf: url)
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Retrieve failed: URL: `\(url)`, Error: `\(error)`")
            throw error
        }
    }
    
    public static func createDocumentURL(withFileName fileName: String) -> URL {
        let fileManager = FileManager.default
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return url.appendingPathComponent(fileName).appendingPathExtension("json")
    }
}