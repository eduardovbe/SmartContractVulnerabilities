pragma solidity ^0.4.0;

contract Bank {
    address owner;
    mapping (address => uint) balances;

    function Bank() public {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0);
        balances[msg.sender] += msg.value;
    }
    //função com tipo de visibilidade definida incorretamente
    function withdraw_value(uint amount){
        msg.sender.send(amount);
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount);
        require(amount > 0);
        withdraw_value(amount);
        balances[msg.sender] -= amount;
    }

    function getBalance() public constant returns (uint) {
        return balances[msg.sender];
    }
}





