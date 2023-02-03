pragma solidity ^0.5.0;

contract Unprotected{
    address owner;

    function Vulnerable() public {
        owner = msg.sender;
    }
	//Função sem proteção que pode autodestruir o contrato
    function destroy() public {
        selfdestruct(owner);
    }
}