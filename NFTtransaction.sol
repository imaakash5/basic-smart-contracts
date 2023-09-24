//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "../src/ERc721Royal.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NFTMarketplace is ERC721, NFTRoyalties{
    

    uint256 public listingPrice_;
    NFTRoyalties public NFT;
    NFT=IERC721(address(NFTRoyalties));
    constructor()ERC721("Aakash","Aksh"){
        owner=payable(msg.sender);
    }
    struct MarketItem{
        uint256 tokenId;
        address payable seller;
        address payable buyer;
        bool sold;
        uint256 price;
    }

    function updateListingPrice(uint256 tokenId, uint listingPrice) public{
        require(msg.sender== owner,"only owner can update set the listing price"); 
        listingPrice_=listingPrice;
    }

    function getListingPrice() public view returns(uint256){
            return listingPrice_;
    }

    function buyItem() public{
        
    }
    
    


}