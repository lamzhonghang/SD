//
//  PaletteLoader.swift
//  YogurtDesignTokenTest
//
//  Created by lan on 2023/12/19.
//

import Foundation

func loadJSON<T: Decodable>(named filename: String, as type: T.Type) -> T? {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json"),
          let data = try? Data(contentsOf: url)
    else {
        return nil
    }

    let decoder = JSONDecoder()
    return try? decoder.decode(type, from: data)
}

func loadColorPaletteDictionary() -> ColorPalette? {
    loadJSON(named: "colorPalette", as: ColorPalette.self)
}

func loadRadiusDictionary() -> RadiusDictionary? {
    loadJSON(named: "radius", as: RadiusDictionary.self)
}

func loadSpacingDictionary() -> SpacingDictionary? {
    loadJSON(named: "spacing", as: SpacingDictionary.self)
}
