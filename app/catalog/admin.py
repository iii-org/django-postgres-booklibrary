from django.contrib import admin

# Register your models here.

# 先將模型導入，再呼叫 admin.site.register 函式來註冊每個模型。
from .models import Author, Genre, Book, BookInstance

# Define the admin class
@admin.register(Author)
class AuthorAdmin(admin.ModelAdmin):
    list_display = ('last_name', 'first_name', 'date_of_birth', 'date_of_death')
    # fields 屬性僅按順序列出了要在表單上顯示的那些欄位。
    fields = ['first_name', 'last_name', ('date_of_birth', 'date_of_death')]

admin.site.register(Genre)
#admin.site.register(BookInstance)

class BooksInstanceInline(admin.TabularInline):
    model = BookInstance

# Register the Admin classes for Book using the decorator
@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'display_genre')
    inlines = [BooksInstanceInline]

# Register the Admin classes for BookInstance using the decorator
@admin.register(BookInstance)
class BookInstanceAdmin(admin.ModelAdmin):
    # 加入列表過濾器可以幫助你過濾想顯示的記錄。加入list_filter這個屬性就可以。
    list_filter = ('status', 'due_back')
    # You can add "sections" to group related model information within the detail form, using the fieldsets attribute.
    fieldsets = (
        (None, {
            'fields': ('book', 'imprint', 'id')
        }),
        ('Availability', {
            'fields': ('status', 'due_back')
        }),
    )
