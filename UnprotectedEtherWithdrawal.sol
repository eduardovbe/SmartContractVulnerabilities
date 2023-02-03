pragma solidity ^0.6.0;


contract Wallet {
    address creator;
    
    mapping(address => uint256) balances;

//construtor com nome errado permitindo que qualquer usuário se passe pelo criador.
    function initWallet() public {
        creator = msg.sender;
    }

    function deposit() public payable {
        assert(balances[msg.sender] + msg.value > balances[msg.sender]);
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(uint256 amount) public {
        require(amount <= balances[msg.sender]);
        msg.sender.transfer(amount);
        balances[msg.sender] -= amount;
    }

//Apos chamar initWallet() o invasor pode sacar todo o Ether com a função abaixo
    function migrateTo(address to) public {
        require(creator == msg.sender);
        to.transfer(this.balance);
    }
