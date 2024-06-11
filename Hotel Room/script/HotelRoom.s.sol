//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {HotelRoom} from "../src/HotelRoom.sol";

contract HotelRoomScript is Script {
  function run() external {

    vm.startBroadcast();
    HotelRoom hotelRoom = new HotelRoom();
    vm.stopBroadcast();

    address client1 = vm.addr(1);

    vm.deal(client1, 1 ether);

    vm.startBroadcast(client1);
    hotelRoom.book{value: 1 ether}();
    vm.stopBroadcast();

    console.log("Status do quarto apos reservar: ", uint(hotelRoom.roomStatusCurrent()));
    console.log("Parabens, voce reservou um quarto!", hotelRoom.owner());

  }
}
