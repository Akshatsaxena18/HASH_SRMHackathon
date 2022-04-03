import React,{useState,useEffect} from 'react';
import { Nav,NavContainer,NavLogo,Navheading, NavMenu, NavItems,Image,MobileIcon } from './Navbarele';
import { BrowserRouter as Router, Routes, Route,Link} from "react-router-dom";
import HamIcon2 from './HamIcon';

const Navbar = ({toggle,isOpen}) => {
  console.log('isOpen from navbar is',isOpen)
  return (
      <Nav>

    <NavContainer>
    <Link style={{ textDecoration: 'none' }} to='/home'>
      <NavLogo>
            <Navheading><img src="./sihlogo2.png" width="300px" alt = "logo icon"/></Navheading>
        </NavLogo></Link>
        <NavMenu>
            <NavItems>
            <MobileIcon onClick={toggle} isOpen={isOpen}>
              
            </MobileIcon>
                {/* <Homebtn></Homebtn> */}
                
                {/* <NavLinks {}/>
                <NavLinks/>
                <NavLinks/> */}
                {/* <img src='./kisanseva.png'></img> */}
            </NavItems>
            
        </NavMenu>
    </NavContainer>
      </Nav>
  )
}

export default Navbar