import Foundation

enum TableSection: String, CaseIterable {
    case goUp = "Подъём"
    case passPoint = "Седловина"
    case goDown = "Спуск"
    
    var rows: [String] {
        switch self {
        case .goUp:
            return ["Перевальный взлёт", "Середина подъёма"]
        case .passPoint:
            return ["Тур", "Записка", "Группа на перевале"]
        case .goDown:
            return ["Перевальный взлёт (обратно)", "Середина спуска"]
        }
    }
}
