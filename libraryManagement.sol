pragma solidity ^0.8.0;

contract libraryManagement{
    // this defines the structure of book
    // consists of name, author, price, and quantity
    struct book{
        string name;
        string author;
        uint256 price;
        uint256 quantity;
    }
    // creates a mapping of the book structure
    mapping(uint256 => book) public books;
    uint256 public bookCount;

    // events for the contract
    event bookAdded(uint256 id);
    event bookRemoved(uint256 id);
    event bookUpdated(uint256 id);

    // function defenitions for the structure book 
    function addBook(string memory _name, string memory _author, uint256 _price, uint256 _quantity) public{
        bookCount++;
        books[bookCount] = book(_name, _author, _price, _quantity);
        emit bookAdded(bookCount);
    }
    function removeBook(uint256 _id) public{
        delete books[_id];
        emit bookRemoved(_id);
    }
    function updateBook(uint256 _id, string memory _name, string memory _author, uint256 _price, uint256 _quantity) public{
        books[_id] = book(_name, _author, _price, _quantity);
        emit bookUpdated(_id);
    }

    struct student{
        string name;
        uint256 roll;
        uint256 year;
        uint256 semester;
        uint256 booksIssued;
        uint256 booksReturned;
    }
    mapping(uint256 => student) public students;
    uint256 public studentCount;
    event studentAdded(uint256 id);
    event studentRemoved(uint256 id);
    event studentUpdated(uint256 id);
    function addStudent(string memory _name, uint256 _roll, uint256 _year, uint256 _semester) public{
        studentCount++;
        students[studentCount] = student(_name, _roll, _year, _semester, 0, 0);
        emit studentAdded(studentCount);
    }
    function removeStudent(uint256 _id) public{
        delete students[_id];
        emit studentRemoved(_id);
    }
    function updateStudent(uint256 _id, string memory _name, uint256 _roll, uint256 _year, uint256 _semester) public{
        students[_id] = student(_name, _roll, _year, _semester, 0, 0);
        emit studentUpdated(_id);
    }   
    function issueBook(uint256 _studentId, uint256 _bookId) public{
        students[_studentId].booksIssued++;
        books[_bookId].quantity--;
    }
    function returnBook(uint256 _studentId, uint256 _bookId) public{
        students[_studentId].booksReturned++;
        books[_bookId].quantity++;
    }

    function getBooksQuantity(uint256 _bookId) public view returns(uint256){
        return books[_bookId].quantity;
    }   
}