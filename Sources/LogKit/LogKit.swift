import Foundation

public struct LogKit {
    
    fileprivate enum LogLevel {
        case info
        case warning
        case error
        case debug
        case onBuild
        case succeed
        
        fileprivate var prefix: String {
            switch self {
            case .info:
                return "INFO <- "
            case .warning:
                return "WARNING <- ⚠️ "
            case .error:
                return "ERROR <- ❌ "
            case .debug:
                return "->"
            case .onBuild:
                return "Building <- 🛠 "
            case .succeed:
                return "Succedd <- 💜💜 "
            }
        }
    }
    
    static func info(_ message: String, shouldLogContext: Bool = true){
        let context = Context(file: #file, line: #line, function: #function)
        LogKit.handleLog(level: .info, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func warning(_ message: String, shouldLogContext: Bool = true){
        let context = Context(file: #file, line: #line, function: #function)
        LogKit.handleLog(level: .warning, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func error(_ message: String, shouldLogContext: Bool = true){
        let context = Context(file: #file, line: #line, function: #function)
        LogKit.handleLog(level: .error, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func debug(_ message: String, shouldLogContext: Bool = true){
        let context = Context(file: #file, line: #line, function: #function)
        LogKit.handleLog(level: .debug, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func onBuild(_ message: String, shouldLogContext: Bool = true){
        let context = Context(file: #file, line: #line, function: #function)
        LogKit.handleLog(level: .onBuild, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    static func succeed(_ message: String, shouldLogContext: Bool = true){
        let context = Context(file: #file, line: #line, function: #function)
        LogKit.handleLog(level: .succeed, str: message, shouldLogContext: shouldLogContext, context: context)
    }
    
    private struct Context {
        var file: String
        var line: Int
        var function: String
        var description: String {
            return "\((file as NSString).lastPathComponent):\(line) \(function)"
        }
    }
    
    private static func handleLog(level: LogLevel, str: String, shouldLogContext: Bool, context: Context) {
        let logComponent = ["[\(level.prefix)]", str]
        
        var logString = logComponent.joined(separator: " ")
        
        if shouldLogContext {
            logString += "-> \(context.description)"
        }
        
        #if DEBUG
        print(logString)
        #endif
        
    }
}
