// SPDX-Licencse-Identifier: MIT

pragma solidity 0.8.24 ;

import  {ERC1967Proxy} from "lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol" ; 
import {BoxV1} from "../src/BoxV1.sol" ; 
import {Script} from "forge-std/Script.sol" ; 

contract   Deploy is Script {


    function run() external returns(address) {
        address  proxy = deploy() ; 

        return proxy  ;
    }

    function deploy() public returns(address) { 
        vm.startBroadcast() ; 
        BoxV1 boxV1 = new BoxV1() ; 
        ERC1967Proxy proxy = new ERC1967Proxy(address(boxV1) , "") ; 
        vm.stopBroadcast() ; 
        
        return address(proxy) ; 
    }

}




   