# HH

Приложение с списком вакансий, подгружаемых из API, с возможностью просмотра детальной информации и сохранения вакансии в избранное.

# Интерфейс
1. Экран входа в аккаунт, с валидацией введенного email.

<p align="center" width="100%">
    <img width="30%" src="https://github.com/LidiaNKR/HH/blob/78599976648849f1cb78b67477cc27d41fe0330c/Images/login.png">
</p>

2. Экран ввода смс пароля, с валидацией наличия введенных 4-х цифр

<p align="center" width="100%">
    <img width="30%" src="https://github.com/LidiaNKR/HH/blob/78599976648849f1cb78b67477cc27d41fe0330c/Images/sms.png">
</p>

3. Экран с списком вакансий.
По нажатию на кнопку лайк, вакансия сохраняется/удаляется из избранного.
Сохранение происходит в локальную бд
По нажатию на ячейку производится переход на экран детальной информации по вакансии

<p align="center" width="100%">
    <img width="30%" src="https://github.com/LidiaNKR/HH/blob/78599976648849f1cb78b67477cc27d41fe0330c/Images/vacancies.png">
</p>

3. Экран с списком избранных вакансий.
По нажатию на кнопку лайк, вакансия сохраняется/удаляется из избранного.
Сохранение происходит в локальную бд
По нажатию на ячейку производится переход на экран детальной информации по вакансии

<p align="center" width="100%">
    <img width="30%" src="https://github.com/LidiaNKR/HH/blob/78599976648849f1cb78b67477cc27d41fe0330c/Images/favorites.png">
</p>

4. Экран с детальной информацией по вакансии

<p align="center" width="100%">
    <img width="30%" src="https://github.com/LidiaNKR/HH/blob/78599976648849f1cb78b67477cc27d41fe0330c/Images/description.png">
</p>

# Используемый стек технологий
- Язык программирования - `Swift`
- Интерфейс - `SwiftUI`
- Архитектура - `MVVM+Coordinator`
- Frameworks: `Combine`, `UserDefaults`
- iOS 16.4+
