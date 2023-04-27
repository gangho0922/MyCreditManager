//
//  main.swift
//  MyCreditManager
//
//  Created by AnnKangHo on 2023/04/25.
//

import Foundation

var Array: [String] = []
var SwiftGrade: [String] = []
var PythonGrade: [String] = []
while true {
    var getout = 0
    print("원하는 기능을 입력해주세요\n1: 학생 추가, 2: 학생 삭제, 3: 성적 추가(변경), 4: 성적 삭제, 5: 평점 보기, X: 종료")
    let insert = readLine() ?? ""
    switch insert {
    case "1":
        print("추가할 학생을 입력해주세요")
        let insert = readLine() ?? ""
        var exist = false
        if insert.count == 0 {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            exist = true
            break
        }
        else {
            if Array.contains(insert) {
                print("\(insert) 은 이미 존재하는 학생입니다. 추가하지 않습니다.")
                exist = true
                break
            }
        }
        if !exist {
            print("\(insert) 학생을 추가했습니다.")
            Array.append(insert)
            SwiftGrade.append("")
            PythonGrade.append("")
        }
    case "2":
        print("삭제할 학생의 이름을 입력해주세요")
        let insert = readLine() ?? ""
        var delete = false
        if insert.count == 0 {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            continue
        }
        if Array.contains(insert) {
            Array.removeAll(where: {$0 == insert})
            print("\(insert) 학생을 삭제하였습니다.")
            
            delete = true
        }
        if !delete {
            print("\(insert)학생을 찾지 못했습니다.")
        }
    case "3":
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.");
        print("입력예) Mickey Swift A+")
        print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        let insert = readLine() ?? ""
        let separateGrade = insert.components(separatedBy: " ")
        if separateGrade.count != 3 || insert.count == 0 {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            continue
        }
        if Array.contains(separateGrade[0]) {
            let index = Array.firstIndex(where: {$0 == separateGrade[0]})
            if separateGrade[1] == "Swift" {
                SwiftGrade[index!] = separateGrade[2]
            }
            else if separateGrade[1] == "Python" {
                PythonGrade[index!] = separateGrade[2]
            }
            print("\(separateGrade[0]) 학생의 \(separateGrade[1]) 과목이 \(separateGrade[2])로 추가(변경) 되었습니다.")
        }
        else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    case "4":
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례대로 작성해주세요.")
        print("입력예) Mickey Swift")
        let insert = readLine() ?? ""
        let separateGrade = insert.components(separatedBy: " ")
        let index = Array.firstIndex(where: {$0 == separateGrade[0]})
        if insert.count != 0 && separateGrade.count == 2 {
            if Array.contains(separateGrade[0]) {
                if separateGrade[1] == "Swift" {
                    SwiftGrade[index!] = ""
                    print("\(separateGrade[0]) 학생의 \(separateGrade[1]) 과목의 성적이 삭제 되었습니다.")
                }
                else if separateGrade[1] == "Python" {
                    PythonGrade[index!] = ""
                }
                else {
                    print("입력이 잘못되었습니다. 다시 확인해주세요.")
                    continue
                }
            }
            else {
                print("\(separateGrade[0]) 학생을 찾지 못했습니다.")
                continue
            }
        }
        else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    case "5":
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        let insert = readLine() ?? ""
        let index = Array.firstIndex(where: {$0 == insert})
        if insert.count != 0 && Array.contains(insert) {
            var swift = Double(0)
            var python = Double(0)
            print("Swift: \(SwiftGrade[index!])")
            print("Python: \(PythonGrade[index!])")
            switch SwiftGrade[index!] {
            case "A+":
                swift = 4.5
            case "A":
                swift = 4
            case "B+":
                swift = 3.5
            case "B":
                swift = 3
            case "C+":
                swift = 2.5
            case "C":
                swift = 2
            case "D+":
                swift = 1.5
            case "D":
                swift = 1
            default:
                swift = 0
            }
            
            switch PythonGrade[index!] {
            case "A+":
                python = 4.5
            case "A":
                python = 4
            case "B+":
                python = 3.5
            case "B":
                python = 3
            case "C+":
                python = 2.5
            case "C":
                python = 2
            case "D+":
                python = 1.5
            case "D":
                python = 1
            default:
                python = 0
            }
            
            print(String(format: "%.2f",(swift + python)/2))
        }
    case "X":
        getout = 1
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
    if getout == 1 {
        print("프로그램을 종료합니다...")
        break
    }
}
