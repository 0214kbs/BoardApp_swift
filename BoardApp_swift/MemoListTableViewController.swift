//
//  MemoListTableViewController.swift
//  BoardApp_swift
//
//  Created by 곽보선 on 2022/03/08.
//

import UIKit

class MemoListTableViewController: UITableViewController {

    
    let formatter: DateFormatter = {
       let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "Ko_kr") //날짜를 한글로 표시
        return f
    }()
    
    
    //ViewController가 관리하는 view가 화면에 표시되기 직전에 자동으로 호출됨
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        //Data source가 전달해주는 최신 data로 update!
//        tableView.reloadData()
//
//        //console로 확인
//        print(#function)
        
    }
    
    var token: NSObjectProtocol?
    
    deinit{
        if let token = token{
            NotificationCenter.default.removeObserver(token)
        }
    }
    
//   ViewController 생성된 후, 자동으로 구현됨
    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main, using: {[weak self] (noti) in
            self?.tableView.reloadData()
        })

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    /*
     <테이블 뷰 구현>
     1. 테이블 뷰 배치 (table view controller를 사용할 경우, 자동 배치)
     2. 프로토타입 셀 디자인 (cell style - subtitle로 변경)
     3. 셀 아이덴티파이어 지정 (cell identifier를 cell로 지정)
     4. 데이터 소스, 델리게이트 연결 (table view controller를 사용할 경우, 자동 연결)
     5. 데이터 소스, 델리게이트 구현
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return Memo.dummyMemoList.count
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let target = Memo.dummyMemoList[indexPath.row]
        // tableView에서 몇번째 셀인지 확인할 수 있음
        
        cell.textLabel?.text = target.content
//        cell.detailTextLabel?.text = "\(target.insertDate)"
        cell.detailTextLabel?.text = formatter.string(from: target.insertDate)
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
