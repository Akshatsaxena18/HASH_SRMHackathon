import React from 'react'
import { HeroCards,HeroContainer,Dtitle,RIDNO,Verify,Heroleft,Heroright,Anch , Form} from './Heroele'
import { BrowserRouter as Router, Routes, Route,Link} from "react-router-dom";
const Hero = ({name,rid,mp}) => {
    var link = "/"+rid;
    // console.log('link is ',link);
    
  return (
    <>
        <HeroContainer>
            <HeroCards>
                <Heroleft>
                <Dtitle>{name}</Dtitle>
                {/* <Rtitle>RID</Rtitle> */}
                <RIDNO>RID :- {rid}</RIDNO>
                </Heroleft>
                <Heroright>
                    
                    {/* <Form action="/verify-rid" method="post"><Verify type="submit" name="verifybtn" value={rid}>Verify</Verify></Form> */}
                <Link style={{ textDecoration: 'none' }} state = {{mp: {mp},rid:{rid}}} to='/review'><Verify>Verify</Verify></Link>
                </Heroright>
            </HeroCards>
        </HeroContainer>
    </>
  )
}

export default Hero