import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import styled from 'styled-components';

const StyledSojuListDiv = styled.div`
    width: 100vw;
    height: 100vh;
    /* background-color: lightcoral; */
    display: grid;
    grid-template-rows: 0.5fr 4fr 4fr;

    .second_line, .three_line{
        display: grid;
        grid-template-columns: 2fr 2fr 2fr 2fr 2fr;
    }

    .detail_box{
        /* background-color: bisque; */
        display: grid;
        grid-template-rows: 7fr 0.8fr 0.8fr 0.8fr;
        justify-content: center;
        align-items: center;
        text-align: center;
        cursor: pointer;
    }

    .first_line{
        font-size: 25px;
    }

    .image{
        border-radius: 10px;
    }
`;


const ProductSoju = () => {
    const navigate = useNavigate();
    const [arr, setArr] = useState([]);

    useEffect(() => {
        fetch("http://127.0.0.1:8888/app/product/list/4",
        {method : 'get'})
        .then( (resp) => {return resp.json()})
        .then( (voList) => {return setArr(voList)
        ;})
        ;
    } , [] );

    const box = () => {
        console.log(arr);
        return arr.map((vo, index) => (
          <div className='detail_box' key={index} onClick={()=>{
            navigate("/product/detail/" + vo.productNo);
          }}
          >
                <img src={vo.image} alt="사진" width='295px' height='300px'/>
                <div>이름:{vo.pName}</div>
                <div>가격:{vo.price}원</div>
                {/* <div>평점:{vo.rating}점</div> */}
          </div>
        ));
      };

    return (
        <StyledSojuListDiv>
            <div className='first_line'> 
            🍾소주도 취향 타는 거 알고 계셨어요?🍾
            </div>
            <div className='second_line'>
                {box()}
            </div>
            <div className='three_line'>
            </div>
            
        </StyledSojuListDiv>
    );
};

export default ProductSoju;