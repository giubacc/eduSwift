//
//  main.swift
//  eduSwift
//
//  Created by Giuseppe Baccini on 28/04/2019.
//  Copyright © 2019 Giuseppe Baccini. All rights reserved.
//

import Foundation

//a string
var str : String

//does not compile because str is not initialized!
//print("str:\(str)")

str = "a string"

let str1 = "another string"

print("str:\(str)")
print("str1:\(str1)")

var optStr : String? = "an optional string"
var optStr1 : String?

print("optStr:\(optStr ?? "was nil!")")
print("optStr1:\(optStr1 ?? "was nil!")")

if let unwrappedStr = optStr{
    print("optStr:\(unwrappedStr)")
}else{
    print("optStr: was nil!")
}

var str2 = optStr1 ?? optStr ?? "default string"

print("str2:\(str2)")

var str3 = optStr!

print("str3:\(str3)")

var implicitlyUnwrappedOptStr : String! = optStr

//ok because implicitlyUnwrappedOptStr is an optional string implicitly unwrapped,
//if implicitlyUnwrappedOptStr is nil, this code crashes
var str4 : String = implicitlyUnwrappedOptStr

//str5 type is automatically inferred as an optional String because
//implicitlyUnwrappedOptStr *is* an optional String
var str5 = implicitlyUnwrappedOptStr

//does not compile because optStr is an optional String not a String.
//var str4 : String = optStr

struct A{
    var field : B?
    
    struct B{
        var field : C?
        
        struct C{
            var field = "end of chain!"
        }
    }
}

var optA : A? = A()
optA!.field = A.B()
optA!.field!.field = A.B.C()

var chainResult = optA?.field?.field?.field
var chainResult1 = optA?.field?.field?.field ?? "default"

print("chainResult1:\(chainResult1)")

var optA1 : A? = A()
optA1!.field = A.B()

chainResult1 = optA1?.field?.field?.field ?? "default"

print("chainResult1:\(chainResult1)")
