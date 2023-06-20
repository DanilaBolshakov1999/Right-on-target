//
//  ViewController.swift
//  Right on target
//
//  Created by IOS - Developer  on 12.06.2023.
//

import UIKit

class ViewController: UIViewController {

    var game: Game! //сущность игра
    
    @IBOutlet var selectNumberSlider: UISlider! //элементы на сцене
    @IBOutlet var resultLabel: UILabel! //элементы на сцене
    
    // MARK: - Жизненный цикл
    // MARK: -  override func viewDidLoad() - он вызывается сразу после загрузки всех отображений (всех графических элементов) и прекрасно подходит для того, чтобы внести финальные правки перед выводом сцены на экран
    override func viewDidLoad() { //корневое представление было загруженно == viewDidLoad
        super.viewDidLoad() // Выполните любую дополнительную настройку после загрузки представления.
        game = Game(startValeu: 1, andValeu: 50, round: 0) //создается экземпляр сущности игра
        updateLabelWithSecretNumber(newText: String(game.currentSecretValeu))//обновляем данные о текущем значении загаданного числа
    }

    // MARK: @IBAction func checkNumber()
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(selectNumberSlider.value)) //вычисляются лчки за раунд
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValeu))
    }
    
    // MARK: - Обновление VIEW
    private func updateLabelWithSecretNumber(newText: String) {
        resultLabel.text = newText
    }
    
    // MARK: - Отображение всплывающего окна
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Game Over",
            message: "You've earned \(score)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Start over",style: .default))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true, completion: nil)
    }
}

