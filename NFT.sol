// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract NonFungibleToken is ERC721, Ownable,ReentrancyGuard {
    using Strings for uint256;
    string public baseURI_;

    constructor() ERC721("NFT","firstNFT"){
        
}


    mapping(address => uint256) public  _balances;

    mapping  (address=>bool)  public allowList;
    uint256 public MAX_SUPPLY = 20;

    function setAllowList(address add) external onlyOwner {
        allowList[add]=true;
    }

    uint256 public totalSupply;
    function safemint_(address to, uint256 tokenId) external  {
        _safeMint(to,tokenId,"");
    }

    
    function mint_(uint256 amount) payable  external onlyOwner {
        require(totalSupply + amount < MAX_SUPPLY);
        require(msg.value >= 0.001 ether, "Not enough funds");
            for(uint256 i = 0; i < amount; i++) {
            _mint(msg.sender,totalSupply);
            totalSupply++;
        }
    }
    
       

    function burn_(uint256 tokenId) external  {
        _burn(tokenId);
    }


    function beforeTokenTransfer(address from, address to, uint256 firstTokenId, uint256 batchSize) external{
        _beforeTokenTransfer(from, to,firstTokenId,batchSize);
        whiteList(from,to);
     
    } 
    
    function whiteList(address from, address to) public view {
        require (allowList[from],"from is not in the list");
        require(allowList[to],"recipient is not in the list");
        } 

    //to get the balance of the current contract
    function withdraw(address addr)   onlyOwner nonReentrant() external{
        uint256 balance = address(this).balance;        
        payable(addr).transfer(balance);

    }

    function _setbaseURI(string memory str) public {
        baseURI_=str;
    }

    function _baseURI() internal  override  view virtual returns(string memory) {
        return baseURI_;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, (tokenId).toString(), ".json")): "";
    }


    
    
    
}

