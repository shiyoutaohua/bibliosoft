package cn.ly.demo.base.dao;

import cn.ly.demo.base.dao.mapper.ProfileMapper;
import cn.ly.demo.base.entity.Profile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileDao {
    @Autowired
    private ProfileMapper profileMapper;

    public Profile getProfileByKey(String key) {
        Profile profile = new Profile();
        profile.setKey(key);
        return profileMapper.getProfileByKey(profile);
    }
}
