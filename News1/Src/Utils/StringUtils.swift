import Foundation

extension String {
    func convertHtml() -> NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        do {
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                NSAttributedString.DocumentReadingOptionKey.documentType:
                    NSAttributedString.DocumentType.html,

                NSAttributedString.DocumentReadingOptionKey.characterEncoding:
                    NSNumber(value: String.Encoding.utf8.rawValue)
            ]
            let attributedString =
                try NSAttributedString(data: data, options: options, documentAttributes: nil)
            return attributedString
        } catch {
            return nil
        }
    }
}
