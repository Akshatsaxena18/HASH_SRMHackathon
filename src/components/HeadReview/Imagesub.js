import React from 'react'
import { Imagesegment,Downloadbtn,Imagesubseg,Downloadbtncomp } from './Imagepartele'
import { FiDownload } from "react-icons/fi";
import { AiFillEye } from "react-icons/ai";

import Button from 'react-bootstrap/Button';
import ModalImage from "react-modal-image";


import { saveAs } from 'file-saver'

  



const Imagesub = ({url,partdetail}) => {

    const downloadImage = () => {

        saveAs(url, 'image.jpg') // Put your image url here.
        // return <div>Here</div>;
      }
    var plant = partdetail.crop+" plant";
  return (
    <>
    <Imagesubseg>
    <Imagesegment>
    <ModalImage
            small={url}
            large={url}
            alt={plant}
            hideDownload={true}
            hideZoom={true}
            className="modal-image"
          />
        </Imagesegment>
        {/* <Downloadbtn>
        
        <Downloadbtncomp>
        
            <Button onClick={downloadImage}><AiFillEye />  VIEW</Button>
            </Downloadbtncomp>
        </Downloadbtn> */}
        </Imagesubseg>
    </>
  )
}

export default Imagesub

