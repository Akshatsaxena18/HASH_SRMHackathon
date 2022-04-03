import styled, {keyframes} from "styled-components";

const fadeIn =  keyframes`
    0% {
        opacity: 0;
        margin-right: -80px;
    }
    100% {
        opacity: 1;
        margin-right:0;
    }
`

export const HamIcon = styled.div`
    z-index: 20;
    position: fixed;
    animation: ${fadeIn} 0.3s;
    display: flex;
    justify-content:space-between;
    align-items: center;
    flex-direction: column;
    top: 20px;
    right: 0;
    width: 60px;
    height: 30px;
    cursor: pointer;
    transition: all .1s ease-in-out;
    transform: translate(-30%, 100%);
    z-index: 1001;
    div {
        width: 80%;
        height: 0.1rem;
        background: #fff;
        transition: all .1s ease-in-out;
        transform-origin: 0px;
          
    &:nth-child(1) {
    
       transform: ${({isOpen}) => (isOpen ? 'rotate(45deg)' : 'rotate(0deg)')};
        }
    &:nth-child(2) {
    width: 60%;
    opacity: ${({isOpen}) => (isOpen ? '0%' : '100%')};
       transform: ${({isOpen}) => (isOpen ? 'translateX(100%)' : 'translateX(0)')};
        }
    &:nth-child(3) {
       transform: ${({isOpen}) => (isOpen ? 'rotate(-45deg)' : 'rotate(0deg)')};
        }
    }
    
`