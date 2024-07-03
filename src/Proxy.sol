// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TargetContract {
    
    function exampleFunction() public pure returns (string memory) {
        return "Hello from Target Contract!";
    }
}

contract Proxy {
    address public targetContract;

   constructor(address _targetContract) {
        targetContract = _targetContract;
    }

    fallback() external payable {
          (bool success, bytes memory returnData) = targetContract.delegatecall(msg.data);
        require(success, "Delegate call failed");
    }

    receive() external payable {}
}