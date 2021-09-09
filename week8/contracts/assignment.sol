// Write a contract that does some very important work. It should contain some very important data structures like Structs,mappings,public and private variables,arrays etc[remember to be flexible s pick your choice]...Write a script using hardhat-ethersjs to deploy the contract and call the functions while logging the output to the console....Write a test in js to test some of its functionalities *
pragma solidity >=0.7.0 <0.9.0;

contract SmartBankAccount {

    uint totalContractBalance = 0;
    uint public userReg =  0;
    struct User{
        address userAddr;
        string name;
        uint balance;
        uint  userId;
    }
     mapping(uint => User) userDetails;
     mapping(address => uint)balances;
    mapping(address => uint) depositTimestamps;
    
function createUser(string memory _name, uint _id) public returns(User memory){
    userDetails[userReg] = userDetails[_id];
    userReg++;
    User storage _users = userDetails[_id];
    _users.name= _name;
    _users.userAddr= msg.sender;
     return _users;

}
function viewUser(uint id) public view returns (User memory){

    return userDetails[id];

}
    function getContractBalance() public view returns(uint){
        return totalContractBalance;
    }
    
   
    function Deposit() public payable {
        balances[msg.sender] = msg.value;
        totalContractBalance = totalContractBalance + msg.value;
        depositTimestamps[msg.sender] = block.timestamp;
    }
    
    function getBalance(address userAddress) public view returns(uint) {
        uint principal = balances[userAddress];
        uint timeElapsed = block.timestamp - depositTimestamps[userAddress]; //seconds
        return principal + uint((principal * 7 * timeElapsed) / (100 * 365 * 24 * 60 * 60)) + 1; //simple interest of 0.07%  per year
    }
    
    function withdraw() public payable {
        address payable withdrawTo = payable(msg.sender);
        uint amountToTransfer = getBalance(msg.sender);
        withdrawTo.transfer(amountToTransfer);
        totalContractBalance = totalContractBalance - amountToTransfer;
        balances[msg.sender] = 0;
    }
    
    function addMoneyToContract() public payable {
        totalContractBalance += msg.value;
    }

    
}