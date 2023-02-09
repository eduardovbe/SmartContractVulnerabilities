pragma solidity ^0.7.0;

contract NFT {
    mapping (uint256 => bool) public tokens;

    function mint(uint256 tokenId) public {
        tokens[tokenId] = true;
    }

    function transfer(uint256 tokenId, address to) public {
        if (tokens[tokenId]) {
            tokens[tokenId] = false;
			//funcionalidade abaixo obsoleta
            to.send(1 ether);
        }
    }
}