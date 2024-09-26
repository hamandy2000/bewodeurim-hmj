package com.app.bewodeurim.repository.inquiry;

import com.app.bewodeurim.domain.inquiry.InquiryDTO;
import com.app.bewodeurim.domain.inquiry.InquiryVO;
import com.app.bewodeurim.domain.pickup.Pagination;
import com.app.bewodeurim.mapper.inquiry.InquiryMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class InquiryDAO {
    private final InquiryMapper inquiryMapper;

    // 1:1 문의 작성
    public void save(InquiryVO inquiryVO) {
        inquiryMapper.insert(inquiryVO);
    }

    // 나의 문의 목록을 offset과 limit으로 가져오는 메서드
    public List<InquiryDTO> findAll(Pagination pagination) {
        return inquiryMapper.selectAll(pagination);
    }

    // 문의 목록 전체 개수 조회
    public int getTotal(){
        return inquiryMapper.selectTotal();
    }

//    // 특정 회원의 1:1 문의 내역 조회
//    public List<InquiryVO> findByMemberId(Long memberId) {
//        return inquiryMapper.findByMemberId(memberId);
//    }
}
