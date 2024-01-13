import React from 'react';
import styled from 'styled-components';
import ProductListItem from './ProductListItem';

const StyledListDiv = styled.div`
    width: 100vw;
    height: 100vh;
    background-color: lightcoral;
    display: grid;
    grid-template-rows: 0.5fr 4fr 0.5fr 4fr;
    grid-template-columns: 2fr 2fr 2fr 2fr 2fr;

    .first_text{
        grid-column: span 5;
    }
    .second_text{
        grid-column: span 5;
    }

    
`;

const ProductList = () => {
    return (
        <StyledListDiv>
            <div className='first_text'> 
            청룡의 해 시작을 함께할 우리술!
            </div>
            <ProductListItem/>
            <ProductListItem/>
            <ProductListItem/>
            <ProductListItem/>
            <ProductListItem/>
            <div className='second_text'>
            평점이 증명해주는 Hot of Hot한 우리술!
            </div>
            <ProductListItem/>
            <ProductListItem/>
            <ProductListItem/>
            <ProductListItem/>
            <ProductListItem/>
        </StyledListDiv>
            
    );
};

export default ProductList;