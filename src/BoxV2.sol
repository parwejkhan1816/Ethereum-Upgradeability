// SPDX-Licencse-Identifier: MIT

pragma solidity 0.8.24 ;


import {UUPSUpgradeable} from "lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol" ;

contract BoxV2 is UUPSUpgradeable {
    
    uint internal number ;
    
    function setNumber(uint num) external {
        number = num  ;
    }
    function getNumber() external view returns(uint){
        return number ; 
    }

    function version() external pure returns(uint){
        return 2 ;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
    
}