from django.urls import path
from . import views

# 如果檢測到URL模式，將調用一個視圖函數：views.index,  它是views.py文件中名為index() 的函數。 
urlpatterns = [
    path('', views.index, name='index'),
    path('books/', views.BookListView.as_view(), name='books'),
]
