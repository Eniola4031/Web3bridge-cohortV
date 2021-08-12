pragma solidity ^0.8.0;


//A Street has 4 houses,each containing 3 flats that contains 5 rooms each.. 
//Each room can hold any number of people....
//Write a soldiity contract that calculates the total number of flats, 
//rooms and occupants in that street
contract arrayTask{
    
    uint  [][5][3][4] public street= [
    [[[2],[1],[2],[2],[2]],
    [[2],[2],[2],[2],[2]],
    [[2],[2],[2],[2],[2]]
    ],
    [[[2],[2],[2],[2],[2]],
    [[2],[2],[2],[2],[2]],
    [[2],[2],[2],[2],[2]]
    ],
    [[[2],[2],[2],[2],[2]],
    [[2],[2],[2],[2],[2]],
    [[2],[2],[2],[2],[2]]
    ],
    [[[2],[2],[2],[2],[2]],
    [[2],[2],[2],[2],[2]],
    [[2],[2],[2],[2],[2]]
    ]
    ];
    //access total houses on the street
   uint public houses = street.length;
      
     //access total flats on the street
     uint public flats= street.length*street[0].length;
     //access total rooms
     uint public rooms= flats*street[0][0].length;
     //access total number of people in the rooms
     uint public occupants= rooms*street[0][0][0].length;
}