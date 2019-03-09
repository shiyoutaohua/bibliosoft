package cn.ly.demo.base.dao;

import cn.ly.demo.base.dao.mapper.LogMapper;
import cn.ly.demo.base.entity.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class LogDao {
    @Autowired
    private LogMapper logMapper;

    public Log getLogById(Log log) {
        return logMapper.getLogById(log);
    }

    public void addLog(Log log) {
        logMapper.addLog(log);
    }

    public List<Log> getLogList(int startIndex, int rowCount) {
        HashMap<String, Integer> parmaMap = new HashMap<>();
        parmaMap.put("startIndex", startIndex);
        parmaMap.put("rowCount", rowCount);
        return logMapper.getLogList(parmaMap);
    }
}
