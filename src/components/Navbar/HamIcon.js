import React from 'react';
import { HamIcon } from './HamIconElement';

const HamIcon2 = ({toggle, isOpen}) => {
  console.log('isopen from hamicon is',isOpen)
  return (<button onClick={toggle}>
      <HamIcon  isOpen={isOpen}>
            <div />
            <div />
            <div />
        </HamIcon>
  </button>);
};

export default HamIcon2;