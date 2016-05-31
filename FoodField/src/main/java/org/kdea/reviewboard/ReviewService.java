package org.kdea.reviewboard;

import java.util.List;

import org.kdea.vo.BoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; // 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	
	public List<BoardVO> getList(){
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<BoardVO> list = dao.getList();
		return list;
	}

}
