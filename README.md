This is a demo as part of the interview before I started working for [Daniel Fone](https://github.com/danielfone/).

It a simple library booking system build by Rails. Here's the original spec:

```
# Specification

The following is a simple library management app. A user can manage books, borrowers and loans.

* A user should be able to manage books (add, view, edit, delete)
  * Books should have a code, title, and author
* A user should be able to manage borrowers (add, view, edit, delete)
  * Borrowers should have a code and name
* The code for both books and borrowers should:
  * Default to the next successive code
      * i.e. if the last book's code was "BOOK1", the next code should default to "BOOK2"
      * if the last book's code isn't able to be incremented, don't worry about it
  * Be required (i.e. present)
  * Be unique
* A user should be able to issue a new loan
  * Loans should record the date/time they were issued
  * The loan due date should default to 3 weeks from now, but can be overridden by the user
  * Only books not currently on loan should be available to loan
* A user should be able to select a borrower and manage their loans from one page
  * They should be able to view outstanding loans
  * They should be able to issue a number of new loans from a single page
  * They should be able to update the due date of any outstanding loans from a single page
  * They should be able to return an existing loan
* A user should be able to select a book and see its current borrower and due date
  * They should be able to return a book currently on loan
* A user should be able to view a book or a borrower and see their borrowing/loan history
  * The borrowing history should list the book, borrower, issue datetime, due date, and return datetime
 ```

The demo is running on Heroku: [https://library-app-demo.herokuapp.com/](https://library-app-demo.herokuapp.com/)
