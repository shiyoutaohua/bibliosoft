package cn.ly.demo.base.dao.mapper;

import cn.ly.demo.base.entity.Profile;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfileMapper {
    Profile getProfileByKey(Profile profile);
}
