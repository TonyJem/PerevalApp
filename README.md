# PerevalApp
 SkillFactory Hackaton
 
Cамый актуальный на текущий момент, код представлен в ветке: main
 
MVP1 версия актуальная на момент 2022-05-22 представлена в ветке: MVP_1_TAG

MVP2 версия актуальная на момент 2022-05-29 представлена в ветке: MVP_2_TAG

Представленое ниже описание актуально для MVP2 версии.

 [Описание функционала](#описание-функционала)

## Общее описание результата:

Использован UIKit (приложение в целом без каких-либо сторонних фреймворков)
При выборе фреймворков рассматривалось применение SnapKit, Alamofire и Realm. Окончательное предпочтение всё же было отдано нативным инструментам от Apple. Решение "не использовать какие-либо фреймворки от стороних лиц" обусловлено относительной простотой приложения, желанием упростить первоначальную настройку и чтоб само приложение было бы, по возможности, без каких-либо громоздких зависимостей и меньше "весило" бы.

Архитектура: Применил MVC, так как он доступнее для понимания и я лучше знаком с ним. По мере расширения функционала запланирован переход на MVVP. Дабы облегчить вход новым разрабам и экономить время в будущем, весь код полностью написан программно. Сториборды или XIBы было решено здесь не применять, чтоб видеть все изменения и производить настройки компонентов в одном месте (в коде) и легко отслеживать все вводимые изменения. И хотя кодом в начале пишется дольше, все же при переиспользовании или корректировке элементов потраченное время возвращается, так как не надо тратить время на проверку настроек, изучая панели каждого сториборда. Так же, сейчас всегда имеется возможность очень легко скопировать нужные настройки и применить их для других элементов. Считаю, что в такой проект даже самому будет легче вернуться, в любой момент, когда придется его снова модифицировать.

Чистота кода: Старался сразу писать удобоваримый и понятный код, но специально, ввиду отсутствия на это времени, рефакторингом не занимался. По добру, все надо хорошенько перелопатить. Подсократить некоторые массивные вьюКонтороллеры путем выноса составных элементов вью в отдельные блоки. Есть повторяющийся код, который надо бы посушить подклассами и т.д. Для текст филдов на экране регистрации можно паттерн Фабрика применить. Эти и прочие существенные правки помогут улучшить код. В некоторых местах бизнес логика приложения может показаться оверкомпликейтит, но это лишь только потому, что это всего лишь первоначальная версия и черновой набросок того, что надо, и многое из этого надо еще шлифовать. Числовые и строковые константы пока вставлены сразу там, где они используются. В дальнейшем числовые перенесу в "константы", а строковые - в "локализед" и вытягивать их уже от туда. И много чего еще... Все эти места знаю, сознательно пока не рефакторил и шел дальше, так как за то время, что ушло бы на рефакторинг, хотел успеть представить больше готового функционала. Перед продолжением проекта неплохо было бы определиться с приоритетами, выявить конкрентые места и цели рефакторинга, и понемногу заменить их более простыми и понятными конструкциями.

Исполняемый apk/ipa-файл: Пока тоже не прилагаю, так как не все еще работает и такой файл просто не имеет смысла пока. Далее предполагается, что продолжу серьезно заниматься приложением и дальше, и вот уже после завершения, когда все будет готово и проверено, можно и файл испечь. По этой же причине не прилагаю файл конфигурации проекта и инструкцию по сборке, так как думаю, что сам же и продолжу заниматься развитием проекта. А если присоединится кто-то еще, то все, что потребуется сам легко ему и объясню.

Адаптив и положение экрана: Адаптива к разным экранам пока нет. Данная версия пока расчитана только для демонстрационных целей и чтоб можно было развивать функционал дальше. Пока возможно только вертикальное положение экрана. Старался делать с мыслью об адаптиве и возможности вертеть экран, поэтому потребуются лишь минорные правки, на которые должно хватить до 20 часов чистого времени.

Версия: Предпочтительно запускать в ИксКоде на симуляторе iPhone11. Версия iOS 14.0 и выше. Желательно запускать симулятор и при этом иметь возможность одновременно наблюдать консоль ИксКода. Вместо логов в коде временно размещены принтЫ, которые позволяют отслеживать текущий статус и наблюдать ошибки, которые отлавливают gaurd'ы. Особенно актуально при отправке перевала из NewMountainPassVC.

Общее резюме: UI практически готов, но в целом по функционалу работа пока на пол пути до завершения и приложение пока функционирует неполностью. В общей сложности, за данные две недели на разработку ушло примерно 110 часов чистого времени и я осуществил за это время далеко не все, что хотел. Из имеющихся знаний применены тоже не все. Из ресурсов больше всего не хватало скорее времени, чем умений, так как работал над проектом в выходные или после основной работы. Знания, как все довести до ума и понимание как все должно работать, имеются. Очень надеюсь, что смогу продолжить работу и сотрудничество с ФСТР и после окончания этого конкурса. Пока лишь довольствуюсь демонстрацией того, что удалось успеть за то время, что у меня было. Имеются вопросы к заказчику по дизайну, функционалу и бэку. Считаю, что приложению очень не хватает аутентификации пользователя, и думаю, что этот функционал, даже для MVP, просто необходим. Надеюсь, что всё это и другие вопросы сможем обсудить, и полностью завершить данное приложение таким, каким оно станет полезным конечным пользователям - путешественникам!

Благодарности и Пожелания: Благодарю за представленную возможность проверить свои силы и почерпнуть новые знания в условиях реального проекта. Считаю, что получилось заложить хорошую основу, которую надо развивать дальше. Если представится возможность продолжить, имеется большое желание познакомится с тем, что происходит на бекэнд стороне и оказать посильную помощь в его совершенствовании.  

  MVP-1 готов на 95% (все работает и шлет запрос при определенных условиях, когда все правильно введено) Посмотреть можно перейдя в ветку MVP_1_TAG
  
  MVP-2 готов на 80% (UI практически завершен,работает частично, работа с сетью на начальной стадии) Посмотреть можно перейдя в ветку MVP_2_TAG
  
  Далее прилагаются скриншоты:
  
  01Стартовый экран:
  
<img src="/readMeImages/01.png" width="25%">
  
  02Регистрация:
  
<img src="/readMeImages/02.png" width="25%">
  
  03Список переалов (если список пуст, то показыем пустой экран)
  
<img src="/readMeImages/03.png" width="25%">
  
  04Карточка Нового перевала:
  
<img src="/readMeImages/04-01.png" width="25%">
<img src="/readMeImages/04-02.png" width="25%">
  
  05Редактирование карточки сохраненного перевала:
  
<img src="/readMeImages/05-01.png" width="25%">
<img src="/readMeImages/05-02.png" width="25%">
  
  06Добавление фотографии:
  
<img src="/readMeImages/06.png" width="25%">
  
  ## Описание Функционала:
  
  Запускать из xCode на симуляторе iOS11.
  
  Сразу После запуска появляется экран загрузки SplashViewController в котором пока установлена задержка в 1 секунду, которая имитирует подгрузку данных. Далее планируется эту задержку убрать, а бизнес-логику дополнить функционалом которая пропускает на следующий экран после того как подтянуты необходимые данные:
  
<img src="/readMeVideos/video01.gif" width="50%">
<br>
<br>
 
  На экране приветсвия нажимаем на кнопку "Войти" и попадаем на экран с регистрацией пользователя. Где надо заполнить данные о пользователе. При появлении клавиатуры зону ввода можно скролить. После нажатия вне полей ввода клавиатура скрывается. Если пользователь по какой либо причине уходит из этого экрана, то все поля которые он ввел сохранят свои занчения даже если прилодение будет выключенно. Данный функционал упростит пользователю закончить ввод данных в следующий раз. Имя, Фамилия, эмайл и телефон обязательны для ввода. Без них в последствии не получится зарегитрировать. Валидацией полей ввода пока не занимался. Валидации для перехода на следующий экран тоже пока нет, но это все можно добавить в следующей версии согласно требованиям заказчика.
  
<img src="/readMeVideos/video02.gif" width="50%">
<br>
<br>
  
 Экран 3 (когда список пустой)
 
 <img src="/readMeVideos/Video03.gif" width="50%">
<br>
 
 Для того чтоб увидеть этот экран, предварительно надо очистить модель: в коде нужно закомментировать эти строки:
 
 <img src="/readMeVideos/Screenshot01.png" width="33%">

Экран 3 (когда модель перевалов наполнена данными)
 
<img src="/readMeVideos/Video04.gif" width="50%">
<br>

Экран 4 (Создание нового перевала)

<img src="/readMeVideos/video05-01.gif" width="50%">
<br>

Экран 4 (Ввод кординат для нового перевала)

<img src="/readMeVideos/video05-02.gif" width="50%">
<br>

Экран 5 (Добавление фотографии для нового перевала). Для того чтобы добавить фотографию из галлереи телефона, надо сначала в выпадающем списке выбрать название тему фотографии, для этого надо свипнуть по строке в таблице. Почему прихоится свипнуть пока не разобрался, в другом месте тот же самый элемент реагирует на клик, е здесь надо свипать. После выбора фотографии сопроваждающий текст заполняется автоматически. Это место, как и прочие, в последствии собираюсь доработать.

<img src="/readMeVideos/video05-03.gif" width="50%">
<br>
