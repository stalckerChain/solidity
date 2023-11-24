// SPDX-License-Identifier: GPL-3.0

// pragma solidity >0.7.0 <0.8.0;
pragma solidity >=0.8.2 <0.9.0;


contract Marketplace {
    event PurchasedItem(address buyer, uint price);

    function buy() public {
        // ...
        emit PurchasedItem(msg.sender, msg.value);
    }

      modifier onlySeller() {
        require(
            msg.sender == seller,
            "Only seller can put an item up for sale."
        );
        _;
    }

    function listItem(seller) public view onlySeller {
        // ...
    }
}
