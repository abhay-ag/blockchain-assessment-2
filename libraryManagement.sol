pragma solidity ^0.8.0;

contract libraryManagement{
    struct book{
        string name;
        string author;
        uint256 price;
        uint256 quantity;
    }
    mapping(uint256 => book) public books;
    uint256 public bookCount;
    event bookAdded(uint256 id);
    event bookRemoved(uint256 id);
    event bookUpdated(uint256 id);
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
}