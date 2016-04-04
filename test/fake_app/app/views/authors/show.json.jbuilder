json.name  @author.name
json.books @author.books, partial: 'books/book', as: :book
json.upcased_title @author.books[0].upcased_title
json.reverse_title @author.books.first.reverse_title
