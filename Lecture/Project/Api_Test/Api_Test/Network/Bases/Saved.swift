//
//  Saved.swift
//  Api_Test
//
//  Created by 김소진 on 2023/01/06.
//

import Foundation

public class Saved {
    
    var _token: String = ""
    static var token: String {
        set { UserDefaults.standard.set(newValue, forKey: "TOKEN") }
        get { return UserDefaults.standard.string(forKey: "TOKEN") ?? "" }
    }
    
    var _push: String = ""
    static var push: String {
        set { UserDefaults.standard.set(newValue, forKey: "PUSH") }
        get { return UserDefaults.standard.string(forKey: "PUSH") ?? "" }
    }
    
    // setGPS -------------------------------------------------------
    public static func setGPS(lat: Double, Lon: Double, address: String) {
        let defaults = UserDefaults.standard
        defaults.set(lat, forKey: "GPS_LAT")
        defaults.set(Lon, forKey: "GPS_LON")
        defaults.set(address, forKey: "GPS_ADDR")
    }
    
    // getGPS -------------------------------------------------------
    public static func getGPS() -> (Double, Double, String) {
        let ud = UserDefaults.standard
        let lat = ud.double(forKey: "GPS_LAT")
        let lon = ud.double(forKey: "GPS_LON")
        let addr = ud.string(forKey: "GPS_ADDR") ?? ""
        return (lat, lon, addr)
    }
    
}
