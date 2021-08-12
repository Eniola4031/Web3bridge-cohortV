pragma solidity ^0.8.0;

//Your contract is supposed to contain a very CRUCIAL function . 
// Your first function accepts 3 different addresses and 
// performs the keccak256 hash of the first 2....
// it then hashes the result with the third address and
// returns the final hash...
// The second CRUCIAL function gets the final hash from the first function above and 
// accepts two arguments(a number and a bytes32 value)...
// it hashes the number separately, performs a typecasting(on the bytes32[second argument]) 
//so as to convert it to a number, hashes the number too, 
//then hashes both of the resulting hashes with the hash gotten from the previous function and 
// finally returns the final hash
// Note: Use the correct function visibility specifiers
contract crucial{
    function function1(address a, address b, address c) public view  returns( bytes32) {
        
       bytes32 hash =keccak256(abi.encodePacked(a,b));
        bytes32 result= keccak256(abi.encodePacked(hash,c));
        return (result);
    }
 function function2(uint anumber, bytes32 astring, address a, address b, address c)public view returns(bytes32){
    //  bytes32 calingfunction=function1(a,b,c);
     bytes32 hash1 =keccak256(abi.encodePacked(anumber));
     //typecasting
     uint256 h=uint256(astring);
     bytes32 convert=keccak256(abi.encodePacked(h));
     //alternatively to line 23 above
     bytes32 finalhash=keccak256(abi.encodePacked(function1(a,b,c),convert,hash1));
     return finalhash;
    
 }
}