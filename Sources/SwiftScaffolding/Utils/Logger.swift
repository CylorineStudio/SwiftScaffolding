//
//  Logger.swift
//  SwiftScaffolding
//
//  Copyright (c) 2025-2026 CylorineStudio. All rights reserved.
//
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file.
//

import Foundation

public final class Logger {
    private static let logQueue: DispatchQueue = .init(label: "SwiftScaffolding.Logging")
    private static let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = .init()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    private static var handle: FileHandle?
    
    /// 开启日志输出。
    /// - Parameter url: 日志文件 `URL`。
    public static func enableLogging(url: URL) throws {
        if FileManager.default.fileExists(atPath: url.path) {
            try FileManager.default.removeItem(at: url)
        }
        try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
        FileManager.default.createFile(atPath: url.path, contents: nil)
        handle = try FileHandle(forWritingTo: url)
        info("Logging is enabled. Log file path: \(url.path)")
    }
    
    private static func log(level: String, message: Any) {
        guard let handle = handle else { return }
        let line: String = "\(dateFormatter.string(from: Date())) \(level): \(message)\n"
        print(line, terminator: "")
        guard let data = line.data(using: .utf8) else { return }
        logQueue.async {
            try? handle.write(contentsOf: data)
        }
    }
    
    internal static func info(_ message: Any) {
        log(level: "INFO", message: message)
    }
    
    internal static func warn(_ message: Any) {
        log(level: "WARN", message: message)
    }
    
    internal static func error(_ message: Any) {
        log(level: "ERROR", message: message)
    }
    
    internal static func debug(_ message: Any) {
        log(level: "DEBUG", message: message)
    }
    
    private init() {
    }
}
