// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import {Proxy} from "./src/Proxy.sol";
import {Target} from "./src/Target.sol";


contract ProxyTest is Test {
    Proxy public proxy;
    Target targetContract;

    function setUp() public {
        
        proxy = new Proxy(address(targetContract));
        targetContract = targetContract;
    }

    function testDelegateCallSuccess() public {
        
        (bool success, bytes memory result) = address(proxy).delegatecall(abi.encodeWithSignature("exampleFunction()"));
        assertTrue(success, "Delegate call failed");
        
    }

    function testDelegateCallFailure() public {
        
        (bool success, bytes memory result) = address(proxy).delegatecall(abi.encodeWithSignature("nonExistentFunction()"));
        assertFalse(success, "Expected delegate call to fail");
    }
}
