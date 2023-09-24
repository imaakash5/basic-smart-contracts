//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTRoyalties is ERC721, ERC2981, Ownable{

    uint256 public totalSupply;
    uint256 public maxSupply=100;
    uint256 public salePrice;
    uint256 public chargeFees = 1 ether;
    

    mapping(uint256=>address) owners;

    constructor()ERC721("NFTRoyalties","Aksh"){
        
    }


    function supportsInterface(bytes4 interfaceId) public view override(ERC721,ERC2981) returns (bool){
        return super.supportsInterface(interfaceId);
    }

    
    //amount is eth caller has sent 
    function mint(uint256 tokenId) public payable{
        require (tokenId>0,"tokens should be greater than zero");
        require(totalSupply+tokenId<maxSupply,"could not exceed maxsupply");
        //checking the user has sufficient gas balance or not
        require((chargeFees*tokenId)<msg.value,"not enough gas in the account");
        for (uint256 i=0;i<tokenId;i++)
        {
            _mint(msg.sender,totalSupply);
            totalSupply++;
           }
        }

    function withdraw() public payable onlyOwner{
        require(address(this).balance>0,"balance should be greater than zero");
        payable(msg.sender).transfer(address(this).balance);
        //payable is the receiver address
        }


    function setRoyaltyInfo(address receiver, uint96 feeNum) public {
            _setDefaultRoyalty(receiver,feeNum);

    }

    

    }

    

   
}