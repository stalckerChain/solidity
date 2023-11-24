// SPDX-License-Identifier: GPL-3.0

// pragma solidity >0.7.0 <0.8.0;
pragma solidity >=0.8.2 <0.9.0;


int32 price = 25; // signed 32 bit integer
uint256 balance = 1000; // unsigned 256 bit integer

bool forSale; //true if an item is for sale
bool purchased; //true if an item has been purchased

if(balance > 0 & balance > price) {
    return true;
}

if(price > balance) {
    return false;
}

uint[] itemIds; // Declare a dynamically sized array called itemIds
uint[3] prices = [1, 2, 3]; // initialize a fixed size array called prices, with prices 1, 2, and 3
uint[] prices = [1, 2, 3]; // same as above
struct Items_Schema {
    uint256 _id;
    uint256 _price;
    string _name;
    string _description;
}

contract Items {
    uint256 item_id = 0;

    mapping(uint256 => Items_Schema) public items;

    struct Items_Schema {
      uint256 _id:
      uint256 _price:
      string _name;
    }

    function listItem(uint 256 memory _price, string memory _name) public {
      item_id += 1;
      items[vehicle_id] = Items_Schema(item_id, _price, _name);
    }
}

contract Marketplace {
    address public seller;
    address public buyer;
    mapping (address => uint) public balances;

    event ListItem(address seller, uint price);
    event PurchasedItem(address seller, address buyer, uint price);

    enum StateType {
          ItemAvailable,
          ItemPurchased
    }

    StateType public State;

    constructor() public {
        seller = msg.sender;
        State = StateType.ItemAvailable;
    }

    function buy(address seller, address buyer, uint price) public payable {
        require(price <= balances[buyer], "Insufficient balance");
        State = StateType.ItemPurchased;
        balances[buyer] -= price;
        balances[seller] += price;

        emit PurchasedItem(seller, buyer, msg.value);
    }
}    
