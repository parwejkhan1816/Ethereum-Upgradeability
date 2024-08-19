// SPDX-Licencse-Identifier: MIT

pragma solidity 0.8.24 ;


import {Script} from "forge-std/Script.sol" ;
import {BoxV1} from "../src/BoxV1.sol" ; 
import {BoxV2} from "../src/BoxV2.sol" ; 
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol" ;


contract Upgrade is Script {


    function run() external returns(address){
        address mostrecentlyDeployed  = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid) ;

        vm.startBroadcast() ; 
        BoxV2 boxV2 = new BoxV2() ;
        vm.stopBroadcast() ;

        address proxy = upgradeBox(mostrecentlyDeployed , address(boxV2)) ;
        
        return proxy ; 
    }

    function upgradeBox(address oldbox,address newbox) public returns(address){

        vm.startBroadcast() ; 
        BoxV1 proxy = BoxV1(payable(oldbox)) ; 
        proxy.upgradeTo(address(newbox)) ; 
        vm.stopBroadcast() ;

        return address(proxy) ; 
    }


}