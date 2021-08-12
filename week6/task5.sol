pragma solidity ^0.8.0;

//A contract contains two very important mappings which are used to track some very *private* info...
//The first mapping allows you to know how many times an address has called a function,
//the second one allows you to know to know the function hash that the address called last...
//Write three different functions that don't *really do anything but returns a bool value* 
//and update the mappings accordingly
contract task5{
    mapping (address=>bytes32) addressToBytes;
    
    // uint a;
    // address b;
    // bytes32 c;
        mapping (address=>uint) addressTonumber;

    function DoNothing() public returns(bool){
        addressTonumber[msg.sender] +=1;
       
        return true;      

    }
    
        function DoNothingAtAll(address add,uint g) public returns(bool){
             addressToBytes[add]=keccak256(abi.encodePacked(g));
            return true;
        
    }
    function DoNothingJor(address add)public view returns(uint,bytes32,bool){
     return   (addressTonumber[add],addressToBytes[add],true);
    }

}