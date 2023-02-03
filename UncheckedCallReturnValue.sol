pragma solidity ^0.8.0;

contract Vulnerable{

//Ao chamar "call" não e verificado se a transferencia foi bem sucedida
    function transfer(address recipient, uint256 amount) public {
        recipient.call.value(amount)("");
		
    }
//Exemplo de chamada correta
	function transfer2(address recipient, uint256 amount) public {
        bool success = recipient.call.value(amount)("");
        require(success, "Transfer failed");
    }
}