shop
====

Структура проекту

* /app
	* /controllers - Відбувається обробка запитів, кожен логічний блок розміщений в окремому файлі
	* /helpers - Допоміжні методи
	* /models - Моделі даних
* /public - Статичні сторінки, css, javascript
	* /css
	* /img
	* /js
* /views - ERB сторінки
	* /layout.erb - шаблонна сторінка, сюди вставляються інші сторінки

Ruby - 1.9.3p429
gems:
	* sinatra
	* data_mapper
	* dm-sqlite-adapter
	* thin - вроді крутий сервер
	* rack-flash3 - https://github.com/treeder/rack-flash

http://localhost:4567/ - адрес для запуску проекту 