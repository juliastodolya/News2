import Foundation

extension DateFormatter {

    static func formatter(dateFormat: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = dateFormat

        return formatter
    }

    static var isoDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZ"

        return formatter
    }
    
    static var iso8601Format: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"

        return formatter
    }

    static var defaultFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd.MM.yyyy HH:mm"

        return formatter
    }

    static var utcFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        return formatter
    }
    
    static var utcFullISO8610Format: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

        return formatter
    }
    
    static var hourAndMinutesUtc: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "HH:mm"

        return formatter
    }

    static var dayAndMounth: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd-MMM"

        return formatter
    }

    static var hourAndMinutes: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "HH:mm"

        return formatter
    }
    
    static var humanFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd MMMM YYYY"
        
        return formatter
    }
    
    static var shortHumanFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd MMM YYYY"
        
        return formatter
    }
    
    static var month: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "MMMM"
        
        return formatter
    }
}
