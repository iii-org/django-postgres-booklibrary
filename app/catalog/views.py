from django.shortcuts import render

# Create your views here.
from .models import Book, Author, BookInstance, Genre

def index(request):
    """View function for home page of site."""

    # Generate counts of some of the main objects
    num_books = Book.objects.all().count()
    num_instances = BookInstance.objects.all().count()

    # Available books (status = 'a')
    num_instances_available = BookInstance.objects.filter(status__exact='a').count()

    # The 'all()' is implied by default.
    num_authors = Author.objects.count()

    context = {
        'num_books': num_books,
        'num_instances': num_instances,
        'num_instances_available': num_instances_available,
        'num_authors': num_authors,
    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'index.html', context=context)

# 我們將使用基於類的通用列表視圖（ListView）-一個繼承自現有視圖的類。因為通用視圖，已經實現了我們需要的大部分功能，並且遵循Django最佳實踐
from django.views import generic

class BookListView(generic.ListView):
    model = Book
    paginate_by = 10

class BookDetailView(generic.DetailView):
    model = Book

# What happens if the record doesn't exist?
def book_detail_view(request, primary_key):
    try:
        book = Book.objects.get(pk=primary_key)
    except Book.DoesNotExist:
        raise Http404('Book does not exist')

    # from django.shortcuts import get_object_or_404
    # book = get_object_or_404(Book, pk=primary_key)

    return render(request, 'catalog/book_detail.html', context={'book': book})

class AuthorListView(generic.ListView):
    """Generic class-based list view for a list of authors."""
    model = Author
    paginate_by = 10


class AuthorDetailView(generic.DetailView):
    """Generic class-based detail view for an author."""
    model = Author
