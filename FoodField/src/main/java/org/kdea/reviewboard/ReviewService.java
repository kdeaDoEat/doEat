package org.kdea.reviewboard;

import java.util.List;

import org.kdea.vo.BoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; // �������Ͽ� ������ ��ϵǾ��� ������ �����ڳ� Setter ���� �ڵ����� ����
	
	public List<BoardVO> getList(){
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<BoardVO> list = dao.getList();
		return list;
	}

}
