// SPDX-License-Identifier: GPL-3.0
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
    mapping(uint256 => book) private books;
    uint256 private bookCount;

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

    // this defines the structure of student
    // consists of name, roll number, books issued and books returned
    struct student{
        string name;
        uint256 roll;
        uint256 year;
        uint256 semester;
        uint256 booksIssued;
        uint256 booksReturned;
    }
    // creates a mapping of the student structure   
    // mapping(uint256 => student) private students;
    student[] private students;
    uint256 private studentCount;
    event studentAdded(uint256 id);

    // function defenitions for the structure student
    function addStudent(string memory _name, uint256 _roll, uint256 _year, uint256 _semester) public{
        studentCount++;
        students.push(student(_name, _roll, _year, _semester, 0, 0));
        emit studentAdded(studentCount);
    }
    function issueBook(uint256 _studentId, uint256 _bookId) public returns(uint256){
        for(uint i = 0; i < students.length; i++){
            if(students[i].roll == _studentId){
                students[i].booksIssued++;
                books[_bookId].quantity--;
                return students[i].booksIssued;
            }
        }
        return 0;
    }
    function returnBook(uint256 _studentId, uint256 _bookId) public returns(uint256){
        for(uint i = 0; i < students.length; i++){
            if(students[i].roll == _studentId){
                students[i].booksReturned++;
                books[_bookId].quantity++;
                return students[i].booksReturned;
            }
        }
        return 0;
    }

    // function to get the number of books of a certain type
    function getBooksQuantity(uint256 _bookId) public view returns(uint256){
        return books[_bookId].quantity;
    }   
}