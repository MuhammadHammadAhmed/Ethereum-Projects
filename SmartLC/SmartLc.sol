pragma solidity >=0.4.22 <0.6.0;
contract smartLc {
    
    struct lc{
     string lcNumber;
     uint lcAmount;
     address buyer;
     address seller;
     address buyerAgent;
     address sellerAgent;
 bool buyerApproval;
 bool sellerApproval;
    }
    //-- data structures
    mapping (string =>lc)lcsList;
    //-state variables;
    uint lcCounter=1;
    uint tokensBalance;
    address tokenAddress;
    function registerLc(address _seller, uint _amount, address _buyerAgent, address _sellerAgent) public {
        address buyer = msg.sender;
        string  memory lcNumber = uint2str(lcCounter++)
     //   lc memory _lc= lc();
    }
    
   

function uint2str(uint _i) public pure returns (string memory _uintAsString) {
    if (_i == 0) {
        return "0";
    }
    uint j = _i;
    uint len;
    while (j != 0) {
        len++;
        j /= 10;
    }
    bytes memory bstr = new bytes(len);
    uint k = len - 1;
    while (_i != 0) {
        bstr[k--] = byte(uint8(48 + _i % 10));
        _i /= 10;
    }
    return string(bstr);
}
    }
    
    
    
