package com.kitri.single.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.single.group.contorller.GroupController;
import com.kitri.single.group.dao.HomeworkDao;
import com.kitri.single.group.model.HProgressDto;
import com.kitri.single.group.model.HomeworkDto;
import com.kitri.single.util.Pagination;
import com.kitri.single.util.SiteConstance;

@Service
public class HomeworkServiceImpl implements HomeworkService{
	
	@Autowired
	private SqlSession sqlSession;
	
	//로그
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@Override
	@Transactional
	public Pagination<HomeworkDto> getHomeworkList(Map<String, String> parameter) {
		//logger.info(parameter.get("page").getClass().toString());
		HomeworkDao homeworkDao = sqlSession.getMapper(HomeworkDao.class);
		int page = Integer.parseInt(parameter.get("page"));
		int homeworkListSize = SiteConstance.GROUP_HOMEWORK_SIZE;
				
		int endRow = page * homeworkListSize;
		int startRow = endRow - homeworkListSize;
			
		logger.info(parameter.toString());
		
		Map<String, Integer> param = new HashMap<String, Integer>();
		int groupNum = Integer.parseInt(parameter.get("groupNum"));
		param.put("groupNum", groupNum);
		param.put("endRow", endRow);
		param.put("startRow", startRow);
		
		//페이지 만들기
		
		Pagination<HomeworkDto> pagination = new Pagination<HomeworkDto>();
		int totalListCount = homeworkDao.selectListCount(groupNum);
		int totalPageCount = (totalListCount - 1) / SiteConstance.GROUP_HOMEWORK_SIZE + 1;
		pagination.settingPagination(SiteConstance.GROUP_HOMEWORK_PAGE_SIZE, totalPageCount
					, page, totalListCount);
		
		List<HomeworkDto> list = homeworkDao.selectHomeworkList(param);
		pagination.setList(list);
		
		
		return pagination;
	}

	@Override
	public int homeworkRegister(HomeworkDto homeworkDto) {
		homeworkDto.setHomeworkContent(homeworkDto.getHomeworkContent().replace("<", "&lt;"));
		homeworkDto.setHomeworkContent(homeworkDto.getHomeworkContent().replace("\n", "<br>"));
		return sqlSession.getMapper(HomeworkDao.class).insertHomework(homeworkDto);
	}

	@Override
	public HomeworkDto getHomeworkDetail(int homeworkNum) {
		HomeworkDto homeworkDto = sqlSession.getMapper(HomeworkDao.class).selectHomework(homeworkNum);
		int count = 0;
		//logger.info(homeworkDto.toString());
		if(homeworkDto.gethProgressList().get(0).getUserId() != null) {
			for(HProgressDto hProgressDto : homeworkDto.gethProgressList()) {
				if("S".equals(hProgressDto.getHprogressSuccess())) {
					count++;
				}
			}
			homeworkDto.setHomeworkSuccessCount(count);
		}
		
		return homeworkDto;
	}
	
	@Override
	@Transactional
	public int hpCreate(HProgressDto hProgressDto) {
		HomeworkDao homeworkDao = sqlSession.getMapper(HomeworkDao.class);
		int result = homeworkDao.countHprogressByUserId(hProgressDto);
		if(result == 0) {
			return homeworkDao.insertHProgress(hProgressDto);
		}else {
			return 0;
		}
		
	}
	
	@Override
	public HProgressDto getHp(HProgressDto hProgressDto) {
		return sqlSession.getMapper(HomeworkDao.class).selectHProgress(hProgressDto);
	}
	
	@Override
	public int hpModify(HProgressDto hProgressDto) {
		return sqlSession.getMapper(HomeworkDao.class).updateHProgress(hProgressDto);
	}
	
	@Override
	public int deleteHProgress(HProgressDto hProgressDto) {
		return sqlSession.getMapper(HomeworkDao.class).deleteHProgress(hProgressDto);
	}
}
