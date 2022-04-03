import React,{useState} from 'react'
import { useLocation } from 'react-router-dom'
import Former from '../components/Former/Former'
import Navbar from '../components/Navbar/Navbar';
import HamIcon2 from '../components/Navbar/HamIcon';
import Sidebar from '../components/Sidebar/Sidebar';

const Feedback = () => {


    const location = useLocation();
    var rid = location.state.rid;
    var Rid = rid.rid;
    var partdetails = location.state.partdetail;
    var partdetail = partdetails.partdetail;
    const [isOpen,setIsOpen] = useState(false)

    const toggle = () => {
      setIsOpen(!isOpen)
      if(isOpen === true){
  
        document.body.classList.remove('noscroll')
        document.body.classList.add('scrollallow')
      }else{
  
        document.body.classList.remove('scrollallow')
        document.body.classList.add('noscroll')
      }
    }
    
    console.log('rid and partdetails in feedback is ',Rid," ",partdetail)
    console.log("partdetails in ",partdetail);
  return (
    <>
    <Navbar/>
    <HamIcon2 toggle={toggle} isOpen={isOpen}/>
    <Sidebar isOpen = {isOpen} toggle={toggle}/>
     <Former rid = {Rid} partdetail={partdetail}>
     </Former>
     {/* <BtnToSend/> */}
    </>
  )
}

export default Feedback