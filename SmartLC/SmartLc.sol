pragma solidity >=0.4.22 <0.6.0;

 /* ERC20 interface, to accessTokenn contract
    */
    
    interface IERC20 {
    
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);

    
    function allowance(address owner, address spender) external view returns (uint256);

   
    function approve(address spender, uint256 amount) external returns (bool);

    
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);

   
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
contract smartLc {
    
   
    
    /* custom Data type*/
    struct lc{
     string lcNumber;
    
     uint lcAmount;
     address buyer;
     address seller;
     address originAgent;
     address destinationrAgent;
 bool originApproval;
 bool destinationApproval;
    }
    //-- data structures
    mapping (string =>lc)lcList;
    mapping (address=>string[]) agentsLC;
    mapping (address=>string[]) sellerLC;
    //-state variables;
    uint lcCounter=1;
    uint tokensBalance;
    address tokenAddress;
    function registerLc(address _seller, uint _amount, address _originAgent, address _destinationgent) public {
        address buyer = msg.sender;
        string  memory lcNumber = concat("SLC",uint2str(lcCounter++));
        //-- filling the LC details
        lc memory regLc;
        regLc.lcNumber =lcNumber;
        regLc.lcAmount =_amount;
        regLc.buyer=buyer;
        regLc.seller= _seller;
        regLc.originAgent =_originAgent;
        regLc.destinationrAgent=_destinationgent;
        regLc.originApproval=false;
        regLc.destinationApproval=false;
        
        lcList[lcNumber]=regLc;
    }
    
    /* 
    For originAgent to give its approval on the LC
    */
    function originApproval(string memory lcNumber)public{
        lc memory lcData =lcList[lcNumber];
        address caller = msg.sender;
        address requiredAgent =lcData.originAgent;
        require(caller==requiredAgent,"You are not the agent of this LC");
        require(!lcData.originApproval,"TYou have already approved the LC");
        lcList[lcNumber].originApproval=true;
        
    }
    
    /* 
    For destination to give its approval on the LC
    */
    function destinationApproval(string memory lcNumber)public{
        lc memory lcData =lcList[lcNumber];
        address caller = msg.sender;
        address requiredAgent =lcData.destinationrAgent;
        require(caller==requiredAgent,"You are not the agent of this LC");
        require(!lcData.destinationApproval,"TYou have already approved the LC");
        lcList[lcNumber].destinationApproval=true;
        
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
    function concat(string memory a, string memory b)  public pure returns (string memory) {

    return string(abi.encodePacked(a, b));

}

    }

    
    
