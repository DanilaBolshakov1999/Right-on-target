//
//  Game.swift
//  Right on target
//
//  Created by IOS - Developer  on 17.06.2023.
//

import UIKit //framework

//MARK: - Protocol GameProtocol
protocol GameProtocol {
    var score: Int { get } //количество заработанных очков
    var currentSecretValeu: Int { get } //содержит текущее загаданное число, которое необходимо указать пользователю с помощью UISlider
    var isGameEnded: Bool { get } //проверяет закончена ли игра
    func restartGame() //начинает новую игру и сразу стартует новый раунд
    func startNewRound() //начинает новый раунд(обновляет загаданное число)
    func calculateScore(with valeu: Int) //сравнивает переданное число с загаданным и начисляет очки
}

//MARK: - Class Game
class Game: GameProtocol {
    var score: Int = 0 //количество заработанных очков
    private let maxCurrentValeu: Int //максимальное загаданное значение
    private let minCurrentValeu: Int //минимальное загаданное значение
    private var currentRound: Int = 0 //текущий раунд
    private let lastRound: Int //последний раунд
    var currentSecretValeu: Int = 0 //содержит текущее загаданное число, которое необходимо указать пользователю с помощью UISlider
    var isGameEnded: Bool {  //проверяет закончена ли игра
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    init?(startValeu: Int, andValeu: Int, round: Int) {
        guard currentRound >= round else { //если текущий раунд больше или равно (guard - false)
            return nil
        }
        //true
        minCurrentValeu = startValeu //присвоить минимальное значение == startValeu
        maxCurrentValeu = andValeu //присвоить максимальное значение == andValeu
        lastRound = round //присвоить для round == lastRound
        currentSecretValeu = self.getNewSecretValeu() //присвоить загаданное значение на UISlier для метода getNewSecretValeu
    }
    
    
    //: MARK: - функция для restart игры
    func restartGame() {
        currentRound = 0 //обнулить раунды
        score = 0 //баллы
        startNewRound() //использовать функцию для старта
    }
    
    //MARK: - startNewRound Стартует новый раунд
    func startNewRound() {
        currentSecretValeu = self.getNewSecretValeu() //присвоить текущее загаданное значение с помощью функции getNewSecretValeu()
        currentRound += 1
    }
    
    private func getNewSecretValeu() -> Int { //загадать и вернуть новое случайное значение
        (minCurrentValeu...maxCurrentValeu).randomElement()!
    }
    
    
    
    func calculateScore(with valeu: Int) { //данная функция ведет подсчет очков
        if valeu > currentSecretValeu { //если значение > значения выведенного на UISlider
            score += 50 - valeu + currentSecretValeu //подсчет - очки (50 - значение + UISlider)
        } else if valeu < currentSecretValeu { //если значение < значения выведенного на UISlider
            score += 50 - currentSecretValeu + valeu //подсчет - очки (50 - UISlider + значение )
        } else {
            score += 50 //подсчет + 50
        }
    }
}
