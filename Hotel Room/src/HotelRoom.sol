// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
  
  enum RoomStatus { Vacant, Occupied }
  RoomStatus public roomStatusCurrent;

  event Occupy(address _occupant, uint256 _value);

  address payable public owner;

  constructor(){
    owner = payable(msg.sender);
    roomStatusCurrent = RoomStatus.Vacant;
  }

  modifier onlyWhileVacant{
    require(roomStatusCurrent == RoomStatus.Vacant, "Room is not vacant");
    _;
  }

  modifier costs(uint256 _amount){
    require(msg.value >= _amount, "Not enough ETH");
    _;
  }

  function book() payable public onlyWhileVacant costs(1 ether){
    roomStatusCurrent = RoomStatus.Occupied;
    (bool sent, bytes memory _data) = owner.call{value: msg.value}("");
    require(true, "ETH sent to owner");

    emit Occupy(msg.sender, msg.value); 
  }
}
