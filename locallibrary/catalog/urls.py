from django.urls import path
from . import views

# 如果檢測到URL模式，將調用一個視圖函數：views.index,  它是views.py文件中名為index() 的函數。 
# In this case we use '<int:pk>'  to capture the book id, which must be an integer, and pass it to the view as a parameter named pk (short for primary key).
urlpatterns = [
    path('', views.index, name='index'),
    path('books/', views.BookListView.as_view(), name='books'),
    path('book/<int:pk>', views.BookDetailView.as_view(), name='book-detail'),
    path('authors/', views.AuthorListView.as_view(), name='authors'),
    path('author/<int:pk>',
         views.AuthorDetailView.as_view(), name='author-detail'),
]
