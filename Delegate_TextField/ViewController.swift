//
//  ViewController.swift
//  Delegate_TextField
//
//  Created by YUNA KO on 17/08/2019.
//  Copyright © 2019 YUNAKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var tf: UITextField!
    
    @IBOutlet var switchbutton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tf.placeholder = "값을 입력하세요"//안내메시지
        self.tf.keyboardType = UIKeyboardType.alphabet//키보드 타입 영문자 패드로
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark //키보드 스타일 어둡게
        self.tf.returnKeyType = UIReturnKeyType.join //리턴키 타입은 join
        self.tf.enablesReturnKeyAutomatically = true //리턴키 자동 활성화 on
        
        //style
        //테두리 스타일 직선
        self.tf.borderStyle = UITextField.BorderStyle.line
        //배경 색상,
        self.tf.backgroundColor = UIColor(white:0.87, alpha:1.0)
        //수직 방향 텍스트 배열 위치 가운데
        self.tf.contentVerticalAlignment = .center
        //수평 방향 텍스트 배열 위치 가운데
        self.tf.contentHorizontalAlignment = .center
        //테두리 색상 회색
        self.tf.layer.borderColor = UIColor.darkGray.cgColor
        //테두리 두께 1.0 픽셀
        self.tf.layer.borderWidth = 2.0
        
        //16진수 컬로 코드를 UIColor 객체 형식으로 변경해 주는 서비스 사이트 http://uicolor.xyz
        
        //텍스트 필드를 최초 응답자로 지정
        //self.tf.becomeFirstResponder()
        
        //델리게이트 지정
        self.tf.delegate = self //텍스트필드에서 미리 정해진 특정 이벤트가 발생하면 현재 뷰 컨트롤러에게 알려달라는 요청
        
        
    }
    @IBAction func confirm(_ sender: Any) {
        self.tf.resignFirstResponder()
    }
    
    @IBAction func input(_ sender: Any) {
        //텍스트 필드를 최초 응답자 객체로 지정
        self.tf.becomeFirstResponder()
    }
    //텍스트필드의 편집을 시작할 대 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBegingEditing execute!")
        //반환값을 false로 지정하면 편집되지 않음
        return true
    }
    //텍스트필드의 편집이 시작된 후 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 시작 되었습니다.")
    }
    //텍스트필드의 내용이 삭제될 떄 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제됩니다.")
        return true
    }
    //텍스트 필드의 내용이 변경될 떄 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다.")
        if switchbutton.isOn == true {
            
            if Int(string) == nil {//입력된 값이 숫자가 아니라면 true를 리턴
                //현재 텍스트 필드에 입력된 길이와 더해질 문자열 길이의 합이 10을 넘는다면 반영하지 않음
                if (textField.text?.count)! + string.count > 10 {
                    return false
                }else{
                    return true
                }
                
            }else{ //입력된 값이 숫자라면 false를 리턴
                
                return false
            }
        }else{
            return false
        }
    }
    //텍스트 필드의 리턴키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        return true
    }
    //텍스트필드의 편집이 종료될 떄 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 종료됩니다.")
        return true
    }
    
    //텍스트필드의 편집이 종료되었을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트필드의 편집이 종료되었습니다.")
    }
}

