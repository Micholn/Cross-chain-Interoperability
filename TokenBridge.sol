//pragma solidity ^0.8.0;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract TokenBridge {
    IERC20 public celoToken;
    address public ethereumRecipient;
    
    constructor(IERC20 _celoToken, address _ethereumRecipient) {
        celoToken = _celoToken;
        ethereumRecipient = _ethereumRecipient;
    }
    
    function transfer(uint256 _amount) external {
        require(celoToken.balanceOf(msg.sender) >= _amount, "Insufficient balance");
        celoToken.transfer(ethereumRecipient, _amount);
    }
}