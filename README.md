База данных "mkk" создана для учета деятельности микрофинансовой компании

**Функционал:**
- Ведение картотеки по клиентам микрофинансовой организации;
- Ведение учета по кредитным продуктам компании;
- Ведение учета операций с займами:
    1) Выдача займа;
    2) Погашение займа;
    3) Начисление процентов по займу;
- Отчетность по операциям с займами.

**Структура базы данных:**
- Есть 3 вида таблиц:
    - Справочники - Ведение клиентов и связанной с ними информации;
    - Документы - Фактически произведенная операция, имеющая признак подписи 
      ( signed ) и дату операции;
    - Регистр - это таблица в которой будут копиться суммы начислений и списаний 
      по займам. Все операции будут агрегироваться в эту таблицу, что позволит 
      получать актуальную информацию по займам на конкретную дату по конкретному
      клиенту.
      
- Используются триггеры для документов, определяющие запись подписанных документов
  (если документ подписан - то данные по нему пишутся в регистр). Так например:
  документ "Выдача займа" будет начислять основной долг клиенту, а погашение будет брать
  остатки по основному долгу и проценту на определенную дату и гасить их в очередности
  Процент, Основной долг. 
- Имеется событие, начисляющее процент по всем не закрытым займам (по умолчанию disabled). 
Отрабатывает раз в сутки в 1:00 ночи по Московскому времени.
- Используются представления для целей предоставления отчетов по займам. Можно 
посмотреть отчет по текущим остаткам Основного долга и процентов по всем не закрытым
займам. И поиск просроченных договоров с количеством дней просрочки.
  
**Замечания по заполнению БД**
- элементы справочников, которые не латинице - созданы генератором. особого смысла не несут.
- Элементы справочников, содержащие русский текст - созданы вручную и вся логика в их построении правильная
  