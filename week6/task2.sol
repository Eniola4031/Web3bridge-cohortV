pragma solidity ^0.8.0;
// Write a contract that has two functions which accept two variables each(They are variables, you can name them anything), compute the keccak256 hashes of these[4] variables and write another function that outputs the two hashes at once...Note that you are submitting the contract file github link

contract hash{
    bytes32 hash1;
    bytes32 hash2;
    
    function HashOne(address owner, uint amount) public returns(bool){
        hash1 = keccak256(abi.encodePacked(owner,amount));
        return true;
    }
        function HashTwo(string memory name, string memory hashType) public returns(bool){
        hash2 = keccak256(abi.encodePacked(name,hashType));
        return true;
    }
    function viewHashes() public view returns(bytes32, bytes32){
        return (hash1, hash2);
    }

}