import React from 'react'
import { BrowserRouter as Router, Routes, Route,Link} from "react-router-dom";
import styled from 'styled-components';

const BtnHere = styled.div`
    margin: 10px;
    padding: 10px;
    color: black;
    background-color: green;
    border-radius: 8px;

`;
const BtnCont = styled.div`
    display: flex;
    justify-content: center;

`;

const EnterBtn = ({partdetail}) => {
    var rid = partdetail.RID;
  return (
    <>
    <BtnCont>
        <BtnHere>
            <Link style={{ textDecoration: 'none' ,color: 'black',fontWeight: 600}} state = {{rid:{rid},partdetail:{partdetail}}} to='/feedback'>Give Feedback</Link>
        </BtnHere>
    </BtnCont>
    </>
  )
}

export default EnterBtn