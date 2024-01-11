import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import styled from 'styled-components';

const StyledAdminNoticeListDiv = styled.div`
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;

    & > table {
        width: 100%;
        height: 100%;
        border: solid 1px;
        border-collapse: collapse;
    }

    td {
        text-align: center;
        border-bottom: solid 1px;
    }

    select {
        height: 25px;
    }

    input {
        height: 25px;
    }

    .list_header {
        width: 100%;
    }

    .notice_no {
        width: 5%;
    }

    .notice_title {
        width: 70%;
    }

    .notice_enrollDate {
        width: 15%;
    }

    .notice_delYn {
        width: 10%;
    }

    .notice_top {
        width: 100%;
        display: flex;
        justify-content: space-between;
        margin-bottom: 1%;
    }

    .notice_select {
        display: flex;
    }

    .notice_write {
        display: flex;
    }

    .notice_write > button {
        width: 150px;
        height: 25px;
        border: none;
        border-radius: 10px;
    }

    .notice_button {
        width: 80px;
        height: 25px;
        border: none;
        border-radius: 10px;
    }

/* 페이지네이션 */
    .notice_page {
        margin-right: 20%;
        list-style-type: none;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: row;
    }
    li {
        margin-left: 10%;
    }


`;

const AdminNoticeList = () => {

    // select 태그 상태설정
    const [select, setSelect] = useState();

    // input 태그 상태설정
    const [input, setInput] = useState();

    const navigate = useNavigate();

    // 검색버튼 동작 함수
    const handleSearch = () => {
        // TODO: 검색 로직 구현
        console.log("aaaa");
    };

    // 초기화 버튼 클릭 시 동작 함수
    const handleReset = () => {

    // select 태그의 상태 초기화 (첫 번째 옵션으로)
    setSelect('');

    // input 태그의 상태 초기화 (빈 문자열로)
    setInput('');
  };

    // 작성하기 버튼 클릭 시 동작 함수
    const handleWrite = () => {
        navigate("/adminNotice/write")
  };

    // 목록 클릭 시 동작 함수
    const handleDetail = () => {
        navigate("/adminNotice/detail")
  };

    return (
        <StyledAdminNoticeListDiv>
            <div className='list_header'>
                <h1>공지사항</h1>
            </div>
            <div className='notice_top'>
                <div className='notice_select'>
                    <div>
                        <select name="" id="" value={select} onChange={ (event) => {
                            return setSelect(event.target.value)
                        } }>
                            <option value=""></option>
                            <option value="number">번호</option>
                            <option value="title">제목</option>
                        </select>
                    </div>
                    <div>
                        <input type="text"  name="searchInput" id="searchInput" value={input} onChange={ (event) => {
                            return setInput(event.target.value);
                        } }></input>
                    </div>
                    <div>
                        <button class="notice_button" style={{backgroundColor: '#ffe23dfb'}} onClick={handleSearch}>검색</button>
                    </div>
                    <div>
                        <button class="notice_button" style={{backgroundColor: '#ffe23dfb'}} onClick={handleReset}>초기화</button>
                    </div>
                </div>
                <div className='notice_write'>
                    <button style={{backgroundColor: '#ffe23dfb'}} onClick={handleWrite}>게시글 작성하기</button>
                </div>
            </div>
            <table>
                <thead>
                    <tr>
                        <td className='notice_no'>번호</td>
                        <td className='notice_title'>제목</td>
                        <td className='notice_enrollDate'>작성일자</td>
                        <td className='notice_delYn'>공개여부</td>
                    </tr>
                </thead>
                <tbody>
                    <tr onClick={handleDetail}>
                        <td className='notice_no'>vo.번호</td>
                        <td className='notice_title'>vo.제목</td>
                        <td className='notice_enrollDate'>vo.작성일자</td>
                        <td className='notice_delYn'>vo.공개여부</td>
                    </tr>
                    <tr onClick={handleDetail}>
                        <td className='notice_no'>vo.번호</td>
                        <td className='notice_title'>vo.제목</td>
                        <td className='notice_enrollDate'>vo.작성일자</td>
                        <td className='notice_delYn'>vo.공개여부</td>
                    </tr>
                    <tr onClick={handleDetail}>
                        <td className='notice_no'>vo.번호</td>
                        <td className='notice_title'>vo.제목</td>
                        <td className='notice_enrollDate'>vo.작성일자</td>
                        <td className='notice_delYn'>vo.공개여부</td>
                    </tr>
                    <tr onClick={handleDetail}>
                        <td className='notice_no'>vo.번호</td>
                        <td className='notice_title'>vo.제목</td>
                        <td className='notice_enrollDate'>vo.작성일자</td>
                        <td className='notice_delYn'>vo.공개여부</td>
                    </tr>
                    <tr onClick={handleDetail}>
                        <td className='notice_no'>vo.번호</td>
                        <td className='notice_title'>vo.제목</td>
                        <td className='notice_enrollDate'>vo.작성일자</td>
                        <td className='notice_delYn'>vo.공개여부</td>
                    </tr>
                </tbody>
            </table>
                    <ul className='notice_page'>
                        <li><a href="">◀</a></li>
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">5</a></li>
                        <li><a href="">▶</a></li>
                    </ul>
        </StyledAdminNoticeListDiv>
    );
};

export default AdminNoticeList;