import React from 'react'
import { HeadCont,MainHead,SmallHead,Smallcontent,ActHead} from './HeadReviewele'
import Imagepart from './Imagepart'

const HeadReview = ({partdetail}) => {
  return (
    <>
    <HeadCont>

    <MainHead>
        <ActHead>{partdetail.crop}</ActHead>
     </MainHead>
    <SmallHead>
        <Smallcontent>{partdetail.date}</Smallcontent>
        <Smallcontent>{partdetail.RID}</Smallcontent>
    </SmallHead>
    </HeadCont>
    
    </>
  )
}

export default HeadReview