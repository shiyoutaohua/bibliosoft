package cn.ly.demo.base.dao.mapper;

import cn.ly.demo.base.entity.Log;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface LogMapper {
    public Log getLogById(Log log);

    public void addLog(Log log);

    List<Log> getLogList(HashMap<String, Integer> param);
}
