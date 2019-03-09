package cn.ly.demo.base.dao.mapper;

import cn.ly.demo.base.entity.Note;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface NoteMapper {
    Note getNoteById(Note note);

    void addNote(Note note);

    List<Note> getNoteList(HashMap<String, Integer> paramMap);
}
