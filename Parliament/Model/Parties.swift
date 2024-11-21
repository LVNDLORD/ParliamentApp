//
//  Parties.swift
//  Parliament
//
//  Created by Andrii Deshko on 8.11.2024.
//


enum Party: String, Codable {
    case kesk = "Keskusta"
    case kok = "Kokoomus"
    case sd = "Sosialidemokraatit"
    case ps = "Perussuomalaiset"
    case vas = "Vasemmistoliitto"
    case kd = "Kristillisdemokraatit"
    case vihr = "Vihreät"
    case r = "Ruotsalainen"
    case liik = "Liike Nyt"


    func fullName() -> String {
        return self.rawValue
    }

    // Custom initializer to handle both short codes and full names
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "kesk", "keskusta":
            self = .kesk
        case "kok", "kokoomus":
            self = .kok
        case "sd", "sosialidemokraatit":
            self = .sd
        case "ps", "perussuomalaiset":
            self = .ps
        case "vas", "vasemmistoliitto":
            self = .vas
        case "kd", "kristillisdemokraatit":
            self = .kd
        case "vihr", "vihreät":
            self = .vihr
        case "r", "ruotsalainen":
            self = .r
        case "liik", "liike nyt":
            self = .liik
        default:
            return nil
        }
    }
}

