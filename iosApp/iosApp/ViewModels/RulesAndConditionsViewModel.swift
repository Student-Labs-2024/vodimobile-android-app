//
//  RulesAndConditionsViewModel.swift
//  iosApp
//
//  Created by Sergey Ivanov on 16.07.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation

final class RulesAndConditionsViewModel {
    let listOfRules: [Rule] = Rule.mockRulesData
}

// Model
struct Rule: Hashable {
    let title: String
    var attributedPartOfTitle: String
    lazy var attributedTitle: AttributedString = {
        var attributedString = AttributedString(title)
        attributedString.font = .header3
        
        if let range = attributedString.range(of: attributedPartOfTitle) {
            attributedString[range].foregroundColor = .blueColor
        }
        
        return attributedString
    }()
    let mainText: String
    let trailingText: String
    
    static let mockRulesData = [
        Rule(
            title: "Условия аренды для водителей",
            attributedPartOfTitle: "Условия аренды",
            mainText: "Возраст от 22 лет и не менее 2 года стажа водительского удостоверения категории B.",
            trailingText: "Это все условия, под которые должен подходить водитель, который берет на себя ответственность управления автомобилями Водимобиль."
        ),
        
        Rule(
            title: "Этапы аренды автомобиля",
            attributedPartOfTitle: "Этапы аренды",
            mainText: "Аренда автомобиля происходит в несколько этапов:",
            trailingText: """
1. Вы выбираете, понравившийся Вам автомобиль;
2. Ознакамливаетесь с условиями аренды автомобиля на сайте, либо консультируетесь с менеджером по телефону или в месенджере;
3. Отправляете документы на проверку службой безопасности. Этот этап занимает не более 20 минут;
4. Менеджер подтверждает бронь ответным сообщением.

В назначенные дату и время мы встречаемся с Вами для подписания договора и передачи выбранного автомобиля. Заключение договора возможно исключительно при наличии у клиента на руках паспорта и водительского удостоверения.
"""
        ),
        
        Rule(
            title: "Служба безопасности",
            attributedPartOfTitle: "безопасности",
            mainText: "Каждая заявка перед арендой проходит тщательную процедуру проверки документов.",
            trailingText: "На основе результатов проверки документов служба безопасности информирует нас о благонадежности клиента. В целях сохранения комфортной среды мы не предоставляем услуги людям с негативной репутацией (нахождение в розыске либо в списках недобросовестных клиентов, с судимостью за угон автомобиля либо кражу, клиентам без документов)."
        ),
        
        Rule(
            title: "Оплата и залог забронированного автомобиля",
            attributedPartOfTitle: "Оплата и залог",
            mainText: "Оплата производится в момент подписания договора наличными либо переводом по номеру телефона на любой банк. Оплаты картой через терминал – нет. По запросу клиента мы предоставляем кассовые чеки с QR кодом.",
            trailingText: """
Оплатить забронированный автомобиль можно с помощью кредитной карты, наличных средств или банковского перевода, вносится оплата за весь период проката автомобиля. Если авто возвращается ранее указанного срока, сделаем перерасчет, при этом оплачивается только время использования.

Залог - это гарантия исполнения договора арендатором. Залоговая часть не является частью стоимости аренды и уплачивается отдельно. Залогом является фиксированная денежная сумма - авто раздела "Эконом" - 5 000 рублей, авто раздела "Комфорт" и "Премиум" - 10 000 рублей. Личные вещи, паспорт, и прочие документы не являются залогом. Мы возвращаем Вам залог в момент сдачи автомобиля и подписания акта приёма/передачи, поэтому ждать не придётся.
"""
        ),
        
        Rule(
            title: "Подача автомобиля",
            attributedPartOfTitle: "Подача",
            mainText: "Водимобиль предлагает подачу автомобиля в любую точку города Омске круглосуточно.",
            trailingText: """
Если вам необходима подача автомобиля в городе, то вы оплачиваете ее отдельно по следующим тарифам:
Бесплатно - самовывоз от офиса дневное время
500 – самовывоз от офиса ночное время
1000 – любая точка города дневное время
2000 – любая точка города ночное время

Дневное время - с 9:00 до 20:00
Ночное время - с 20:00 до 9:00
"""
        ),
        
        Rule(
            title: "Заявка на ночную аренду",
            attributedPartOfTitle: "ночную аренду",
            mainText: "Заявки на ночную аренду принимаются до 18:00 текущего дня.",
            trailingText: "Если вы хотите забронировать автомобиль с ночной подачей, то необходимо оставить заявку заранее. Заявки принимаются к рассмотрению до 18:00 текущего дня. То есть если вы оставили заявку на бронирование с подачей с 20:00 до 9:00 текущего дня, но сделали это после 18:00, то, к сожалению, мы не сможем ее рассмотреть."
        ),
        
        Rule(
            title: "Время на передачу автомобиля",
            attributedPartOfTitle: "Время на передачу",
            mainText: "15 минут – время, в которое мы должны уложиться с Вами.",
            trailingText: "Большой поток клиентов не позволяет нам уделять большее количество времени на подписание договора. Вся информация насчёт технического состояния автомобиля, сроков, порядка оплаты и продления аренды, условий пользования автомобилем и прочие вопросы прописаны на нашем сайте и в договоре."
        ),
        
        Rule(
            title: "Суточный пробег",
            attributedPartOfTitle: "Суточный",
            mainText: "Есть ограничение на суточный пробег - 200 км, который входит в стоимость аренды.",
            trailingText: "Вы можете превышать этот лимит, в таком случае перепробег считается из расчета 5 руб/км (эконом), 10 руб/км (комфорт и премиум)."
        ),
        
        Rule(
            title: "Территория передвижения",
            attributedPartOfTitle: "Территория",
            mainText: "Ограничений по поездкам внутри Сибирского федерального округа - нет.",
            trailingText: "Пересечение Сибирского федерального округа, как и границ РФ - согласовывается с менеджером."
        ),
        
        Rule(
            title: "Продление аренды автомобиля",
            attributedPartOfTitle: "Продление аренды",
            mainText: "Продление аренды автомобиля происходит следующим образом:",
            trailingText: """
1. За сутки вы предупреждаете менеджера о намерении продлить автомобиль на N-е количество суток;
2. Менеджер считает сумму и присылает Вам реквизиты для перечисления денежных средств за продлённый период аренды;
3. Вам осталось оплатить и прислать чек об оплате менеджеру – аренда продлена.
"""
        ),
        
        Rule(
            title: "Передача авто второму водителю",
            attributedPartOfTitle: "второму водителю",
            mainText: "Передача автомобиля второму водителю возможна, если он подходит под требования условий аренды «Водимобиль».",
            trailingText: "В таком случае мы вносим в договор второго водителя. Стоимость составления договора на второго водителя – 300 рублей."
        ),
        
        Rule(
            title: "Страховка и ответственность",
            attributedPartOfTitle: "Страховка",
            mainText: "Автомобили застрахованы полисом ОСАГО.",
            trailingText: """
Если ДТП произошло не по Вашей вине, и предоставлены все справки с места ДТП – сумма ответственности равна нулю.

Если же ДТП произошло по вине клиента, то ответственность за возмещение ущерба ложится на клиента. В случае невозможности доказательства вины третьего лица ответственность также ложится на клиента.

В случае ДТП клиент сам должен разрешить ситуацию со вторым участником ДТП, без участия арендодателя.
"""
        ),
        
        Rule(
            title: "Бензин и заправка",
            attributedPartOfTitle: "Бензин",
            mainText: "Арендатор заправляет автомобиль самостоятельно, только бензином АИ-95.",
            trailingText: "Автомобиль подаётся с тем количеством топлива, который остался после предыдущего использования. Соответственно, вернуть автомобиль необходимо с тем же уровнем. Если в баке топлива меньше, чем было при передаче Вам автомобиля, то производится оплата из расчета 50 рублей — один литр. Автомобиль с полным баком подаётся исключительно по запросу клиента."
        ),
        
        Rule(
            title: "Мойка автомобиля",
            attributedPartOfTitle: "Мойка",
            mainText: "Мойка автомобилей оплачивается отдельно - 1 500 рублей.",
            trailingText: """
В каком случае клиент оплачивает мойку:
1. Автомобиль грязный снаружи и внутри;
2. Автомобиль чистый снаружи, но грязный внутри (коврики, крошки, пятна);
3. Автомобиль чистый внутри, но грязный снаружи (пороги, диски, отдельный части автомобиля);
4. Автомобиль в песке или пыли.

Погодные условия не является условием неисполнения договорных обязательств, касающихся автомойки.

Если на момент бронирования автомобиль находится в грязном состоянии, мы предлагаем Вам выбрать, в каком виде арендовать автомобиль в целях экономии Ваших денежных средств на мойку.

Экстренная подача автомобиля (30 – 90 минут) не гарантирует подачу автомобиля в чистом виде, т.к. время на мойку авто занимает минимум 2 часа. Поэтому рекомендуем бронировать авто заранее.
"""
        ),
        
        Rule(
            title: "Штрафы при аренде авто",
            attributedPartOfTitle: "Штрафы",
            mainText: "Штрафы за нарушение ПДД оплачивает клиент.",
            trailingText: """
После того, как штраф поступает нам, менеджер отсылаем Вам информацию о нём. Вам необходимо лишь перевести сумму штрафа по реквизитам арендодателя.

Штраф за курение в салоне – 5000
Штраф за просрочку оплаты продления автомобиля – 1000 р/сутки
Штраф за утерю документов – 10000 р/единица
Штраф за утерю ключа/сигнализации – 10000 р/единица
"""
        ),
        
        Rule(
            title: "Дополнительное оборудование",
            attributedPartOfTitle: "Дополнительное",
            mainText: "Детское кресло, держатель для телефона, зарядка - бесплатно.",
            trailingText: "Водимобиль бесплатно предоставит любое дополнительное оборудование. Важно предварительно перед арендой уточнить что из оборудования Вам потребуется."
        )
    ]
}
