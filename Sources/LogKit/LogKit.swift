import Foundation

public struct LogKit {
    
    private enum LogLevel {
        case info
        case warning
        case error
        case debug
        case onBuild
        case success
        
        fileprivate var prefix: String {
            switch self {
            case .info:
                return "INFO <- ❓"
            case .warning:
                return "WARNING <- ⚠️"
            case .error:
                return "ERROR <- ❌"
            case .debug:
                return "DEBUG"
            case .onBuild:
                return "BUILDING <- 🛠"
            case .success:
                return "SUCCESS <- 💜💛💙"
            }
        }
    }
    
    public static func info(_ message: String, file: String = #file, line: Int = #line, function: String = #function, shouldLogContext: Bool = true) {
        let context = Context(file: file, line: line, function: function)
        LogKit.handleLog(level: .info, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func warning(_ message: String, file: String = #file, line: Int = #line, function: String = #function, shouldLogContext: Bool = true) {
        let context = Context(file: file, line: line, function: function)
        LogKit.handleLog(level: .warning, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func error(_ message: String, file: String = #file, line: Int = #line, function: String = #function, shouldLogContext: Bool = true) {
        let context = Context(file: file, line: line, function: function)
        LogKit.handleLog(level: .error, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func debug(_ message: String, file: String = #file, line: Int = #line, function: String = #function, shouldLogContext: Bool = true) {
        let context = Context(file: file, line: line, function: function)
        LogKit.handleLog(level: .debug, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func onBuild(_ message: String, file: String = #file, line: Int = #line, function: String = #function, shouldLogContext: Bool = true) {
        let context = Context(file: file, line: line, function: function)
        LogKit.handleLog(level: .onBuild, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    public static func success(_ message: String, file: String = #file, line: Int = #line, function: String = #function, shouldLogContext: Bool = true) {
        let context = Context(file: file, line: line, function: function)
        LogKit.handleLog(level: .success, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    private struct Context {
        var file: String
        var line: Int
        var function: String
        var description: String {
            return "\((file as NSString).lastPathComponent): \(line) \(function)"
        }
    }
    
    private static func handleLog(level: LogLevel, str: String, shouldLogContext: Bool, context: Context) {
        let logComponent = ["[\(level.prefix)]", str]
        
        var logMessage = logComponent.joined(separator: " ")
        
        if shouldLogContext {
            logMessage += " -> \(context.description)"
        }
        
        #if DEBUG
        print(logMessage)
        #endif
        
    }
}
