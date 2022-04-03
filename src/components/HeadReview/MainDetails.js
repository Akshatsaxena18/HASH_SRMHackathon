import React from 'react'
import { Mdcontainer,Leftcontainer,Ptext,Rightcontainer,Vtext } from './MainDetailsele'

const MainDetails = ({partdetail}) => {
  return (
    <>
        <Mdcontainer>
            <Leftcontainer>
                <Ptext>crop:-<Vtext>{partdetail.crop}</Vtext></Ptext>
                <Ptext>No of cases:-<Vtext>{partdetail.no_of_cases}</Vtext></Ptext>
                <Ptext>Location:-<Vtext>{partdetail.location}</Vtext></Ptext>
            </Leftcontainer>
            <Rightcontainer>
            <Ptext>Soil:- <Vtext>{partdetail.soil}</Vtext></Ptext>
            <Ptext>Rain:-<Vtext>{partdetail.humidity}</Vtext></Ptext>
            <Ptext>No of images:-<Vtext>{partdetail.no_of_images}</Vtext></Ptext>
            </Rightcontainer>
        </Mdcontainer>
    </>
  )
}

export default MainDetails