+негры пидорасы

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//18
contract Coin {
    address minter;
    mapping (address => uint) balances;

    constructor () {
        minter = msg.sender;
    }

    event Send(address from, address to, uint value);

    function mint(address owner, uint amount) public {
        if (msg.sender != minter) return;
        balances[owner] += amount;
    }
    
    function send(address receiver, uint amount) public {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Send(msg.sender, receiver, amount);
    }

    function queryBalance(address addr) view public returns (uint balance) {
        return balances[addr];
    }
}
