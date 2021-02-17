大多數文件的命名和它們的目的有關
* 視圖函數就是views.py
* 模型就是models.py
* 測試是tests.py
* 網站管理設置是admin.py
* 註冊應用是apps.py  
並且還包含了為項目所用的最小模板。


一個migration文件夾，用來存放 “migrations” ——當你修改你的數據模型時，這個文件會自動升級你的資料庫。
__init__.py —一個空文件，Django/Python會將這個文件作為Python套件包並允許你在項目的其他部分使用它。
