//
//  main.swift
//  MyCreditManager
//
//  Created by AnnKangHo on 2023/04/25.
//

import Foundation

var Array: [String] = []
while true {
    print("원하는 기능을 입력해주세요\n1: 학생 추가, 2: 학생 삭제, 3: 성적 추가(변경), 4: 성적 삭제, 5: 평점 보기, X: 종료")
    let insert = readLine() ?? ""
    switch insert {
    case "1":
        print("추가할 학생을 입력해주세요")
        let insert = readLine() ?? ""
        Array.append(insert)
    case "2":
        print("2이야")
    case "3":
        print("3이야")
    case "4":
        print("4이야")
    case "5":
        print("5이야")
    case "X":
        print("X이야")
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}
